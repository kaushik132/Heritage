<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductReview;
use App\Models\Wishlist;
use App\Models\Cart;
use App\Models\HomeBanner;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\UserAddress;
use App\Models\Inquiry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Barryvdh\DomPDF\Facade\Pdf;

class HomeController extends Controller
{
    public function index()
    {
        $homebanner = HomeBanner::where('is_active', true)->latest()->take(8)->get();
        $procathome = ProductCategory::where('is_active', true)->take(8)->get();
        $retailerProduct = Product::where('is_active', true)->where('is_featured', true)->where('type', 'retailer')->take(8)->get();
        $wholesellerProduct = Product::where('is_active', true)->where('is_featured', true)->where('type', 'wholeseller')->take(8)->get();
        $trendingProduct = Product::where('is_active', true)->where('is_featured', true)->latest()->take(4)->get();
        $reviews = ProductReview::where('verified_purchase', true)->where('is_approved', true)->latest()->get();
        $featuredProducts = Product::where('is_active', true)
            ->where('is_featured', true)
            ->with(['primaryImage', 'images', 'productcategory'])
            ->latest()
            ->take(8)
            ->get();
        return view('index', compact('featuredProducts', 'procathome', 'retailerProduct', 'wholesellerProduct', 'trendingProduct', 'reviews','homebanner'));
    }

    public function account()
    {
        $user      = Auth::user();
        $orders    = Order::where('user_id', $user->id)->with('items')->latest()->get();
        $addresses = UserAddress::where('user_id', $user->id)->get();
        $wishlists = Wishlist::where('user_id', $user->id)->with(['product.primaryImage'])->get();

        return view('account', compact('user', 'orders', 'addresses', 'wishlists','homebanner'));
    }

    // ─── CART ─────────────────────────────────────────

    public function cart()
    {
        if (!Auth::check()) {
            return redirect()->route('login')->with('info', 'Please login to view your cart.');
        }

        $cartItems = Cart::where('user_id', Auth::id())
            ->with('product.primaryImage')
            ->latest()
            ->get();

        $subtotal = $cartItems->sum(fn($item) => $item->product->price * $item->quantity);
        $tax      = round($subtotal * 0.18, 2);
        $total    = $subtotal + $tax;

        return view('cart', compact('cartItems', 'subtotal', 'tax', 'total'));
    }

    public function addToCart(Request $request)
    {
        if (!Auth::check()) {
            return response()->json(['status' => 'login_required'], 401);
        }

        $product = Product::findOrFail($request->product_id);

        $existing = Cart::where('user_id', Auth::id())
            ->where('product_id', $product->id)
            ->where('color', $request->color)
            ->first();

        if ($existing) {
            $existing->increment('quantity', $request->quantity ?? $product->moq);
        } else {
            Cart::create([
                'user_id'    => Auth::id(),
                'product_id' => $product->id,
                'color'      => $request->color ?? null,
                'quantity'   => $request->quantity ?? $product->moq,
            ]);
        }

        $count = Cart::where('user_id', Auth::id())->count();

        return response()->json([
            'status'  => 'success',
            'message' => $product->name . ' added to cart!',
            'count'   => $count,
        ]);
    }

    public function updateCart(Request $request)
    {
        if (!Auth::check()) {
            return response()->json(['status' => 'login_required'], 401);
        }

        $cartItem = Cart::where('id', $request->cart_id)
            ->where('user_id', Auth::id())
            ->firstOrFail();

        $qty = (int) $request->quantity;

        if ($qty <= 0) {
            $cartItem->delete();
        } else {
            $moq = $cartItem->product->moq ?? 1;
            $cartItem->update(['quantity' => max($qty, $moq)]);
        }

        return response()->json(['status' => 'success']);
    }

    public function removeFromCart(Request $request)
    {
        Cart::where('id', $request->cart_id)
            ->where('user_id', Auth::id())
            ->delete();

        return response()->json(['status' => 'success']);
    }

    public function clearCart()
    {
        Cart::where('user_id', Auth::id())->delete();
        return back()->with('success', 'Cart cleared.');
    }

    public function checkout()
    {
        $cartItems = Cart::where('user_id', Auth::id())
            ->with('product.primaryImage')
            ->get();

        if ($cartItems->isEmpty()) return redirect()->route('cart');

        $subtotal  = $cartItems->sum(fn($i) => $i->product->price * $i->quantity);
        $tax       = round($subtotal * 0.18, 2);
        $total     = $subtotal + $tax;
        $addresses = Auth::user()->addresses()->latest()->get();

        return view('checkout', compact('cartItems', 'subtotal', 'tax', 'total', 'addresses'));
    }

    function contact()
    {
        return view('contact');
    }

    public function orderConfirm(Order $order)
    {
        // Sirf apna order dekh sake
        if ($order->user_id !== Auth::id()) abort(403);
        $order->load('items');
        return view('order_confirm', compact('order'));
    }

    // ─── Products Listing ─────────────────────────────
    public function products(Request $request)
    {
        $query = Product::where('is_active', true)
            ->with(['primaryImage', 'productcategory']);

        // Category filter
        if ($request->filled('category') && $request->category !== 'All') {
            $query->whereHas('productcategory', function ($q) use ($request) {
                $q->where('slug', $request->category);
            });
        }
        // Price filter
        if ($request->filled('price')) {

            match ($request->price) {
                '50-100'  => $query->whereBetween('price', [50, 100]),
                '100-150' => $query->whereBetween('price', [100, 150]),
                '150+'    => $query->where('price', '>', 150),
                default   => null,
            };
        }

        // Sort
        match ($request->sort ?? 'newest') {
            'price_asc'  => $query->orderBy('price', 'asc'),
            'price_desc' => $query->orderBy('price', 'desc'),
            'popular'    => $query->orderBy('review_count', 'desc'),
            default      => $query->latest(),
        };

        $products = $query->paginate(12)->withQueryString();

        // Dynamic Categories
        $categories = ProductCategory::where('is_active', 1)->get();

        return view('products', compact('products', 'categories'));
    }

    // ─── Product Detail ───────────────────────────────
    public function productDetail(string $slug)
    {
        $product = Product::where('slug', $slug)
            ->where('is_active', true)
            ->with(['images', 'reviews'])
            ->firstOrFail();
        if (Auth::check()) {
            Auth::user()->load('wishlists'); // ← ye add karo
        }

        $recommended = Product::where('is_active', true)
            ->where('category', $product->category)
            ->where('id', '!=', $product->id)
            ->with(['primaryImage'])
            ->take(6)
            ->get();

        return view('product_detail', compact('product', 'recommended'));
    }

    // ─── Submit Review ────────────────────────────────
    public function submitReview(Request $request, string $slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();

        $validated = $request->validate([
            'rating'  => 'required|integer|min:1|max:5',
            'title'   => 'required|string|max:200',
            'body'    => 'required|string|min:100|max:1000',
        ]);

        ProductReview::create([
            'product_id'       => $product->id,
            'user_id'          => Auth::id(),
            'reviewer_name'    => Auth::user()->first_name . ' ' . Auth::user()->last_name,
            'title'            => $validated['title'],
            'body'             => $validated['body'],
            'rating'           => $validated['rating'],
            'verified_purchase' => false,
            'is_approved'      => true,
        ]);

        // Rating recalculate karo
        $avg = $product->reviews()->avg('rating');
        $product->update([
            'rating'       => round($avg, 1),
            'review_count' => $product->reviews()->count(),
        ]);

        return back()->with('review_success', 'Review submitted successfully!');
    }

    function trackOrder()
    {
        return view('track_order');
    }
    // ─── ADDRESS ──────────────────────────────────────

    public function storeAddress(Request $request)
    {
        $request->validate([
            'first_name'     => 'required|string',
            'last_name'      => 'required|string',
            'phone'          => 'required|string',
            'email'          => 'required|email',
            'street_address' => 'required|string',
            'city'           => 'required|string',
            'state'          => 'required|string',
            'zip_code'       => 'required|string',
        ]);

        UserAddress::create([
            'user_id'        => Auth::id(),
            'first_name'     => $request->first_name,
            'last_name'      => $request->last_name,
            'phone'          => $request->phone,
            'email'          => $request->email,
            'street_address' => $request->street_address,
            'city'           => $request->city,
            'state'          => $request->state,
            'zip_code'       => $request->zip_code,
        ]);

        return back()->with('success', 'Address added successfully!');
    }

    public function deleteAddress(UserAddress $address)
    {
        if ($address->user_id !== Auth::id()) abort(403);
        $address->delete();
        return back()->with('success', 'Address deleted.');
    }

    // ─── Wishlist Page ────────────────────────────────
    public function wishlist()
    {
        if (!Auth::check()) {
            return redirect()->route('login')
                ->with('info', 'Please login to view your wishlist.');
        }

        $wishlists = Wishlist::where('user_id', Auth::id())
            ->with(['product.primaryImage'])
            ->latest()
            ->get();

        return view('wishlist', compact('wishlists'));
    }

    // ─── Toggle Wishlist (Add/Remove) ─────────────────
    public function toggleWishlist(Product $product)
    {
        if (!Auth::check()) {
            return response()->json(['status' => 'login_required'], 401);
        }

        $existing = Wishlist::where('user_id', Auth::id())
            ->where('product_id', $product->id)
            ->first();

        if ($existing) {
            $existing->delete();
            $added = false;
        } else {
            Wishlist::create([
                'user_id'    => Auth::id(),
                'product_id' => $product->id,
            ]);
            $added = true;
        }

        return redirect()->back()->with([
            'status' => 'success',
            'added'  => $added,
            'count'  => Wishlist::where('user_id', Auth::id())->count(),
        ]);
    }

    // ─── Remove Single Item ───────────────────────────
    public function removeWishlist(Product $product)
    {
        Wishlist::where('user_id', Auth::id())
            ->where('product_id', $product->id)
            ->delete();

        return back()->with('success', 'Item removed from wishlist.');
    }

    // ─── Clear All ────────────────────────────────────
    public function clearWishlist()
    {
        Wishlist::where('user_id', Auth::id())->delete();
        return back()->with('success', 'Wishlist cleared.');
    }

    public function placeOrder(Request $request)
    {
        $request->validate([
            'first_name'     => 'required|string|max:100',
            'last_name'      => 'required|string|max:100',
            'email'          => 'required|email',
            'phone'          => 'required|string|max:15',
            'street_address' => 'required|string',
            'city'           => 'required|string',
            'state'          => 'required|string',
            'zip_code'       => 'required|string',
        ]);

        $cartItems = Cart::where('user_id', Auth::id())
            ->with('product')
            ->get();

        if ($cartItems->isEmpty()) return redirect()->route('cart');

        $subtotal = $cartItems->sum(fn($i) => $i->product->price * $i->quantity);
        $tax      = round($subtotal * 0.18, 2);
        $total    = $subtotal + $tax;

        $order = Order::create([
            'user_id'        => Auth::id(),
            'order_number'   => Order::generateOrderNumber(),
            'status'         => 'pending',
            'payment_method' => 'cod',
            'payment_status' => 'pending',
            'subtotal'       => $subtotal,
            'tax'            => $tax,
            'discount'       => 0,
            'total'          => $total,
            'first_name'     => $request->first_name,
            'last_name'      => $request->last_name,
            'email'          => $request->email,
            'phone'          => $request->phone,
            'street_address' => $request->street_address,
            'city'           => $request->city,
            'state'          => $request->state,
            'zip_code'       => $request->zip_code,
            'country'        => $request->country ?? 'India',
            'notes'          => $request->notes,
        ]);

        foreach ($cartItems as $item) {
            OrderItem::create([
                'order_id'      => $order->id,
                'product_id'    => $item->product_id,
                'product_name'  => $item->product->name,
                'product_image' => $item->product->primary_image_url,
                'price'         => $item->product->price,
                'quantity'      => $item->quantity,
                'total'         => $item->product->price * $item->quantity,
            ]);
        }

        if ($request->boolean('save_address')) {
            UserAddress::create([
                'user_id'        => Auth::id(),
                'first_name'     => $request->first_name,
                'last_name'      => $request->last_name,
                'phone'          => $request->phone,
                'email'          => $request->email,
                'street_address' => $request->street_address,
                'city'           => $request->city,
                'state'          => $request->state,
                'zip_code'       => $request->zip_code,
            ]);
        }

        // Cart clear karo DB se
        Cart::where('user_id', Auth::id())->delete();

        return redirect()->route('order.confirm', $order->id);
    }

    public function downloadInvoice(Order $order)
    {
        if ($order->user_id !== Auth::id()) abort(403);

        $order->load('items');

        $pdf = Pdf::loadView('invoice', compact('order'));

        return $pdf->download('Invoice-' . $order->order_number . '.pdf');
    }


    public function submitInquiry(Request $request)
    {
        $request->validate([
            'name'       => 'required|string|max:255',
            'phone'      => 'required|string|max:20',
            'email'      => 'required|email|max:255',
            'quantity'   => 'required|string|max:255',
            'message'    => 'nullable|string',
            'product_id' => 'nullable|exists:products,id',
        ]);

        Inquiry::create([
            'user_id'    => Auth::id(),
            'product_id' => $request->product_id,
            'name'       => $request->name,
            'phone'      => $request->phone,
            'email'      => $request->email,
            'quantity'   => $request->quantity,
            'message'    => $request->message,
        ]);

        return redirect()->back()->with('toast_success', 'Inquiry submitted successfully!');
    }
}
