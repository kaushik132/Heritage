<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\SitemapController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('cart', [HomeController::class, 'cart'])->name('cart');
Route::get('checkout', [HomeController::class, 'checkout'])->name('checkout');
Route::get('contact', [HomeController::class, 'contact'])->name('contact');
Route::get('order-confirm', [HomeController::class, 'orderConfirm'])->name('contact');

Route::get('products', [HomeController::class, 'products'])->name('products');
Route::get('products/{slug}', [HomeController::class, 'productDetail'])->name('productdetail');

Route::get('track-order', [HomeController::class, 'trackOrder'])->name('trackOrder');

Route::post('inquiry', [HomeController::class, 'submitInquiry'])->name('inquiry.submit');


// Auth::routes();
// ── Guest only routes ──────────────────────────
// routes/web.php

Route::middleware('guest')->group(function () {
    Route::get('/login',    [AuthController::class, 'loginPage'])->name('login');
    Route::get('/register', [AuthController::class, 'registerPage'])->name('register');
    Route::post('/login',   [AuthController::class, 'login'])->name('login.post');
    Route::post('/register', [AuthController::class, 'register'])->name('register.post');

    // Forgot Password
    Route::get('/forgot-password',          [AuthController::class, 'forgotPasswordPage'])->name('password.request');
    Route::post('/forgot-password',         [AuthController::class, 'sendResetLink'])->name('password.email');

    // Reset Password
    Route::get('/reset-password/{token}',   [AuthController::class, 'resetPasswordPage'])->name('password.reset');
    Route::post('/reset-password',          [AuthController::class, 'resetPassword'])->name('password.update');
});

Route::middleware('auth')->group(function () {
    Route::get('account', [HomeController::class, 'account'])->name('account');
    Route::post('/profile/update',  [AuthController::class, 'updateProfile'])->name('profile.update');
    Route::post('/password/update', [AuthController::class, 'updatePassword'])->name('password.update');
    Route::post('/logout',          [AuthController::class, 'logout'])->name('logout');

    Route::post('products/{slug}/review', [HomeController::class, 'submitReview'])->name('review.submit');

    // routes/web.php — auth middleware group mein add karo
    Route::get('wishlist', [HomeController::class, 'wishlist'])->name('wishlist');
    Route::post('wishlist/toggle/{product}', [HomeController::class, 'toggleWishlist'])->name('wishlist.toggle');
    Route::delete('wishlist/remove/{product}', [HomeController::class, 'removeWishlist'])->name('wishlist.remove');
    Route::delete('wishlist/clear', [HomeController::class, 'clearWishlist'])->name('wishlist.clear');

    // Cart
    Route::get('cart',          [HomeController::class, 'cart'])->name('cart');
    Route::post('cart/add',     [HomeController::class, 'addToCart'])->name('cart.add');
    Route::post('cart/update',  [HomeController::class, 'updateCart'])->name('cart.update');
    Route::post('cart/remove',  [HomeController::class, 'removeFromCart'])->name('cart.remove');
    Route::post('cart/clear',   [HomeController::class, 'clearCart'])->name('cart.clear');


    //checkout
    Route::get('checkout', [HomeController::class, 'checkout'])->name('checkout');
    Route::post('checkout', [HomeController::class, 'placeOrder'])->name('order.place');
    Route::get('order-confirm/{order}', [HomeController::class, 'orderConfirm'])->name('order.confirm');
    Route::get('track-order', [HomeController::class, 'trackOrder'])->name('trackOrder');

    // Address routes
    Route::post('address/store', [HomeController::class, 'storeAddress'])->name('address.store');
    Route::delete('address/{address}', [HomeController::class, 'deleteAddress'])->name('address.delete');

    // pdf order
    Route::get('order/{order}/invoice', [HomeController::class, 'downloadInvoice'])->name('order.invoice');
});


//SiteMap

Route::get('sitemap.xml', [SitemapController::class, 'index'])->name('sitemap');
