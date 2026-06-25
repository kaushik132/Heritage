@extends('dashboard.layout.main')
@section('content')

<section class="bg-gradient-to-r from-[#404040] to-[#1F2937] text-white border-b border-white/20">

    <div class="max-w-7xl mx-auto px-4 md:px-8">

        <!-- Breadcrumb -->
        <p class="text-sm text-gray-300 mb-4">
            <a href="#" class="hover:text-white transition">Home</a>
            <span class="mx-1">/</span>
            <span class="text-white">All Products</span>
        </p>

        <!-- Heading -->
        <div class="text-center">
            <h1 class="text-3xl md:text-4xl font-[400] italic mb-2">
                Track Order
            </h1>
            <p class="text-sm md:text-base text-gray-300">
                Check your selected items and proceed to payment</p>
        </div>

    </div>

</section>


<!-- TRACK ORDER PAGE -->
<section class="bg-light">
    <div class="max-w-8xl mx-auto px-4 md:px-8">

        <!-- Header -->
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-[22px] font-bold text-primary">Order Details</h1>
            <a href="#" class="bg-brand text-white text-[13px] font-semibold px-5 py-2.5 hover:opacity-90 transition-opacity cursor-pointer flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                    <polyline points="7 10 12 15 17 10" />
                    <line x1="12" y1="15" x2="12" y2="3" />
                </svg>
                Download Invoice
            </a>
        </div>

        <!-- Order Meta -->
        <div class="bg-white border border-[#D6D6D6] p-5 mb-5 grid grid-cols-2 md:grid-cols-5 gap-4">
            <div>
                <p class="text-[11px] text-secondary mb-1">Order Number</p>
                <p class="text-[13px] font-semibold text-primary">2345576867</p>
            </div>
            <div>
                <p class="text-[11px] text-secondary mb-1">Order Placed</p>
                <p class="text-[13px] font-semibold text-primary">Feb 20, 2024</p>
            </div>
            <div>
                <p class="text-[11px] text-secondary mb-1">Order delivered</p>
                <p class="text-[13px] font-semibold text-primary">Feb 20, 2024</p>
            </div>
            <div>
                <p class="text-[11px] text-secondary mb-1">No of Items</p>
                <p class="text-[13px] font-semibold text-primary">2</p>
            </div>
            <div>
                <p class="text-[11px] text-secondary mb-1">Status</p>
                <p class="text-[13px] font-semibold text-green-600">Delivered</p>
            </div>
        </div>

        <!-- Order Tracking -->
        <div class="bg-white border border-[#D6D6D6] p-6 mb-5">
            <div class="flex items-center justify-between mb-8">
                <h2 class="text-[15px] font-semibold text-primary">Order Tracking</h2>
                <p class="text-[13px] text-secondary">Order ID: <span class="font-semibold text-primary">#FHHH6577</span></p>
            </div>

            <!-- Progress Steps -->
            <div class="relative flex items-start justify-between">

                <!-- Progress Line Background -->
                <div class="absolute top-[18px] left-0 right-0 h-[2px] bg-[#D6D6D6] z-0"></div>
                <!-- Progress Line Active (3 out of 4) -->
                <div class="absolute top-[18px] left-0 w-[66%] h-[2px] bg-brand z-0"></div>

                <!-- Step 1 — Done -->
                <div class="relative z-10 flex flex-col items-center text-center w-1/4">
                    <div class="w-9 h-9 rounded-full bg-brand text-white flex items-center justify-center text-[13px] font-bold mb-3 shadow-md">1</div>
                    <p class="text-[12px] font-semibold text-primary">Order Placed</p>
                    <p class="text-[11px] text-secondary mt-0.5">Feb 25th, 2024</p>
                </div>

                <!-- Step 2 — Done -->
                <div class="relative z-10 flex flex-col items-center text-center w-1/4">
                    <div class="w-9 h-9 rounded-full bg-brand text-white flex items-center justify-center text-[13px] font-bold mb-3 shadow-md">2</div>
                    <p class="text-[12px] font-semibold text-primary">Order Packed</p>
                    <p class="text-[11px] text-secondary mt-0.5">Feb 26th, 2024</p>
                </div>

                <!-- Step 3 — Active -->
                <div class="relative z-10 flex flex-col items-center text-center w-1/4">
                    <div class="w-9 h-9 rounded-full bg-brand text-white flex items-center justify-center text-[13px] font-bold mb-3 shadow-md ring-4 ring-brand/20">3</div>
                    <p class="text-[12px] font-semibold text-primary">In Transit</p>
                    <p class="text-[11px] text-secondary mt-0.5">Feb 27th, 2024</p>
                </div>

                <!-- Step 4 — Pending -->
                <div class="relative z-10 flex flex-col items-center text-center w-1/4">
                    <div class="w-9 h-9 rounded-full border-2 border-[#D6D6D6] bg-white text-secondary flex items-center justify-center text-[13px] font-bold mb-3">4</div>
                    <p class="text-[12px] font-semibold text-secondary">Out of delivery</p>
                    <p class="text-[11px] text-secondary mt-0.5">Feb 27th, 2024</p>
                </div>

            </div>
        </div>

        <!-- Items from Order -->
        <div class="bg-white border border-[#D6D6D6] p-6 mb-5">
            <h2 class="text-[15px] font-semibold text-primary mb-5">Items from the order</h2>

            <div class="flex flex-col gap-4">

                <!-- Item -->
                <div class="flex items-center gap-4 pb-4 border-b border-[#D6D6D6]">
                    <img src="https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=200&q=80"
                        class="w-14 h-14 object-covershrink-0" />
                    <div class="flex-1">
                        <p class="text-[14px] font-semibold text-primary">Celestial Evening Gown</p>
                        <p class="text-[12px] text-brand">Midnight Blue/M</p>
                        <p class="text-[12px] text-secondary">QTY: 1</p>
                    </div>
                    <p class="text-[14px] font-semibold text-primary shrink-0">₹347.00</p>
                </div>

                <!-- Item -->
                <div class="flex items-center gap-4 pb-4 border-b border-[#D6D6D6]">
                    <img src="https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=200&q=80"
                        class="w-14 h-14 object-cover rounded-lg shrink-0" />
                    <div class="flex-1">
                        <p class="text-[14px] font-semibold text-primary">Celestial Evening Gown</p>
                        <p class="text-[12px] text-brand">Midnight Blue/M</p>
                        <p class="text-[12px] text-secondary">QTY: 1</p>
                    </div>
                    <p class="text-[14px] font-semibold text-primary shrink-0">₹347.00</p>
                </div>

                <!-- Item -->
                <div class="flex items-center gap-4">
                    <img src="https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99?w=200&q=80"
                        class="w-14 h-14 object-cover rounded-lg shrink-0" />
                    <div class="flex-1">
                        <p class="text-[14px] font-semibold text-primary">Celestial Evening Gown</p>
                        <p class="text-[12px] text-brand">Midnight Blue/M</p>
                        <p class="text-[12px] text-secondary">QTY: 1</p>
                    </div>
                    <p class="text-[14px] font-semibold text-primary shrink-0">₹347.00</p>
                </div>

            </div>
        </div>

        <!-- Price Summary -->
        <div class="bg-white border border-[#D6D6D6] p-6 mb-6">
            <div class="flex flex-col gap-3">
                <div class="flex justify-between text-[13px]">
                    <span class="text-secondary">Subtotal</span>
                    <span class="text-primary font-medium">₹347.00</span>
                </div>
                <div class="flex justify-between text-[13px]">
                    <span class="text-secondary">Delivery Fee</span>
                    <span class="text-green-600 font-medium">+₹34</span>
                </div>
                <div class="flex justify-between text-[13px]">
                    <span class="text-secondary">Discount</span>
                    <span class="text-red-500 font-medium">-₹344</span>
                </div>
                <hr class="border-[#D6D6D6]" />
                <div class="flex justify-between">
                    <span class="text-[16px] font-bold text-primary">Total</span>
                    <span class="text-[16px] font-bold text-primary">₹347.00</span>
                </div>
            </div>
        </div>


    </div>
</section>



@endsection
