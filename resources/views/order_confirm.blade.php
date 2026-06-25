@extends('dashboard.layout.main')
@section('content')

<section class="bg-[#F5F0EB] min-h-screen flex items-center justify-center py-10">
    <div class="max-w-lg w-full mx-auto px-4">
        <div class="bg-white rounded-2xl shadow-sm border border-[#D6D6D6] p-8 flex flex-col items-center text-center">

            <!-- Icon -->
            <div class="mb-6">
                <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="40" cy="40" r="40" fill="#22C77A" fill-opacity="0.15"/>
                    <circle cx="40" cy="40" r="30" fill="#22C77A"/>
                    <path d="M26 40 L35 50 L54 30" stroke="white" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>

            <h1 class="text-[26px] font-bold text-primary mb-2">Order Confirmed!</h1>
            <p class="text-[13px] text-secondary leading-relaxed mb-1">
                Thank you for your order. We'll send a confirmation to <strong>{{ $order->email }}</strong>
            </p>
            <p class="text-[13px] text-secondary mb-2">
                Order number: <span class="font-semibold text-primary">#{{ $order->order_number }}</span>
            </p>
            <p class="text-[13px] text-secondary mb-6">
                Payment: <span class="font-semibold text-green-600">Cash on Delivery</span>
            </p>

            <!-- Order Items -->
            <div class="w-full border border-[#D6D6D6] rounded-xl p-4 mb-6 text-left">
                <h3 class="text-[14px] font-semibold text-primary mb-3">Order Items</h3>
                @foreach($order->items as $item)
                <div class="flex items-center gap-3 mb-3">
                    <img src="{{ $item->product_image }}" class="w-12 h-12 object-cover rounded" />
                    <div class="flex-1">
                        <p class="text-[13px] font-medium text-primary">{{ $item->product_name }}</p>
                        <p class="text-[11px] text-secondary">{{ $item->quantity }} meters × ₹{{ $item->price }}</p>
                    </div>
                    <span class="text-[13px] font-bold text-primary">₹{{ number_format($item->total, 2) }}</span>
                </div>
                @endforeach
                <hr class="border-[#D6D6D6] my-2"/>
                <div class="flex justify-between">
                    <span class="text-[14px] font-bold text-primary">Total</span>
                    <span class="text-[14px] font-bold text-brand">₹{{ number_format($order->total, 2) }}</span>
                </div>
            </div>

            <!-- Shipping -->
            <div class="w-full border border-[#D6D6D6] rounded-xl p-4 mb-6 text-left">
                <h3 class="text-[14px] font-semibold text-primary mb-2">Shipping To</h3>
                <p class="text-[13px] text-secondary">{{ $order->first_name }} {{ $order->last_name }}</p>
                <p class="text-[13px] text-secondary">{{ $order->street_address }}, {{ $order->city }}</p>
                <p class="text-[13px] text-secondary">{{ $order->state }} - {{ $order->zip_code }}</p>
                <p class="text-[13px] text-secondary">{{ $order->phone }}</p>
            </div>

            <!-- Buttons -->
            <div class="flex items-center gap-4 w-full">
                <a href="{{ route('account') }}"
                    class="flex-1 border border-[#D6D6D6] text-primary text-[14px] font-semibold py-3 rounded-lg text-center hover:border-primary transition-colors">
                    View Order
                </a>
                <a href="{{ route('home') }}"
                    class="flex-1 bg-brand text-white text-[14px] font-semibold py-3 rounded-lg text-center hover:opacity-90 transition-opacity">
                    Continue Shopping
                </a>
            </div>

        </div>
    </div>
</section>

@endsection
