@extends('dashboard.layout.main')
@section('content')

<section class="bg-gradient-to-r from-[#404040] to-[#1F2937] text-white border-b border-white/20">
    <div class="max-w-7xl mx-auto px-6 md:px-8 py-8 md:py-12">
        <nav class="flex justify-center md:justify-start mb-6">
            <ol class="flex items-center space-x-2 text-xs md:text-sm text-gray-300">
                <li><a href="{{ route('home') }}" class="hover:text-white">Home</a></li>
                <li class="flex items-center space-x-2"><span class="text-gray-500">/</span><span class="text-white">Shopping Cart</span></li>
            </ol>
        </nav>
        <div class="text-center">
            <h1 class="text-[28px] md:text-4xl font-[400] italic mb-2 text-white">Shopping Cart</h1>
            <p class="text-[13px] md:text-base text-gray-300">Check your selected items and proceed to payment</p>
        </div>
    </div>
</section>

<section class="bg-[#F5F0EB] min-h-screen py-10">
    <div class="max-w-6xl mx-auto px-4 md:px-8">

        @if(session('success'))
            <div class="mb-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">✓ {{ session('success') }}</div>
        @endif

        @if($cartItems->isEmpty())
            <div class="text-center py-20">
                <iconify-icon icon="lucide:shopping-cart" width="60" class="text-gray-200 mb-4"></iconify-icon>
                <h2 class="text-[22px] font-semibold text-primary mb-2">Your cart is empty</h2>
                <p class="text-secondary text-[14px] mb-6">Add some products to continue.</p>
                <a href="{{ route('products') }}" class="inline-block bg-brand text-white text-[13px] font-semibold px-8 py-3 hover:opacity-90">
                    Browse Products
                </a>
            </div>
        @else
        <div class="grid grid-cols-1 lg:grid-cols-[1fr_360px] gap-6">

            <!-- LEFT: Cart Items -->
            <div class="flex flex-col gap-4">
                @foreach($cartItems as $item)
                @if($item->product)
                <div class="bg-white rounded-xl border border-[#D6D6D6] p-3 flex items-start gap-3">

                    <img src="{{ $item->product->primary_image_url }}"
                        class="w-20 h-20 md:w-24 md:h-24 object-cover rounded-lg shrink-0"/>

                    <div class="flex-1 flex flex-col min-w-0 h-20 md:h-24 justify-between">
                        <div class="flex items-start justify-between gap-2">
                            <div>
                                <h3 class="text-[13px] md:text-[15px] font-semibold text-primary leading-tight">
                                    {{ $item->product->name }}
                                </h3>
                                @if($item->color)
                                    <span class="text-[11px] text-secondary">Color: {{ $item->color }}</span>
                                @endif
                            </div>
                            <button onclick="removeItem({{ $item->id }})"
                                class="text-secondary hover:text-red-500 transition-colors shrink-0 p-1">
                                <svg class="w-4 h-4 md:w-5 md:h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M3 6h18M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2M10 11v6M14 11v6"/>
                                </svg>
                            </button>
                        </div>

                        <div class="flex items-end justify-between gap-2">
                            <div class="flex flex-col">
                                <span class="text-[14px] md:text-[16px] font-bold text-primary">
                                    ₹{{ number_format($item->product->price * $item->quantity, 2) }}
                                </span>
                                <span class="text-[11px] text-secondary">₹{{ number_format($item->product->price, 2) }} / meter</span>
                            </div>

                            <div class="flex items-center border border-[#D6D6D6] rounded-md overflow-hidden shrink-0">
                                <button onclick="updateQty({{ $item->id }}, {{ $item->quantity - $item->product->moq }}, {{ $item->product->moq }})"
                                    class="w-7 h-7 flex items-center justify-center text-primary hover:bg-[#f7e5baa8] text-sm">-</button>
                                <span class="w-10 h-7 flex items-center justify-center text-[12px] font-semibold text-primary border-x border-[#D6D6D6]">
                                    {{ $item->quantity }}
                                </span>
                                <button onclick="updateQty({{ $item->id }}, {{ $item->quantity + $item->product->moq }}, {{ $item->product->moq }})"
                                    class="w-7 h-7 flex items-center justify-center text-primary hover:bg-[#f7e5baa8] text-sm">+</button>
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                @endforeach
            </div>

            <!-- Summary -->
            <div class="flex flex-col gap-4">
                <div class="bg-white rounded-xl border border-[#D6D6D6] p-5">

                    <div class="flex flex-col gap-2 mb-4">
                        <div class="flex justify-between text-[13px]">
                            <span class="text-secondary">Subtotal:</span>
                            <span class="text-primary font-medium">₹{{ number_format($subtotal, 2) }}</span>
                        </div>
                        <div class="flex justify-between text-[13px]">
                            <span class="text-secondary">GST (18%)</span>
                            <span class="text-primary">+₹{{ number_format($tax, 2) }}</span>
                        </div>
                        <hr class="border-[#D6D6D6] my-1"/>
                        <div class="flex justify-between">
                            <span class="text-[15px] font-bold text-primary">Total</span>
                            <span class="text-[15px] font-bold text-primary">₹{{ number_format($total, 2) }}</span>
                        </div>
                    </div>

                    <div class="flex flex-col gap-1.5 mb-5">
                        <p class="text-[12px] text-secondary">✓ Secure checkout</p>
                        <p class="text-[12px] text-secondary">✓ 30-day returns</p>
                        <p class="text-[12px] text-secondary">✓ Money-back guarantee</p>
                    </div>

                    <a href="{{ route('checkout') }}"
                        class="w-full bg-brand text-white py-3.5 rounded-lg text-[14px] font-semibold hover:opacity-90 text-center block">
                        Continue Checkout
                    </a>
                </div>
            </div>

        </div>
        @endif
    </div>
</section>

<script>
function removeItem(cartId) {
    fetch('{{ route("cart.remove") }}', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
        body: JSON.stringify({ cart_id: cartId })
    }).then(() => window.location.reload());
}

function updateQty(cartId, qty, moq) {
    const newQty = Math.max(qty, moq);
    fetch('{{ route("cart.update") }}', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
        body: JSON.stringify({ cart_id: cartId, quantity: newQty })
    }).then(() => window.location.reload());
}
</script>

@endsection
