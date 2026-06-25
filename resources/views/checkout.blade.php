@extends('dashboard.layout.main')
@section('content')

    <section class="bg-gradient-to-r from-[#404040] to-[#1F2937] text-white border-b border-white/20">
        <div class="max-w-7xl mx-auto px-6 md:px-8 py-8 md:py-12">
            <nav class="flex justify-center md:justify-start mb-6">
                <ol class="flex items-center space-x-2 text-xs md:text-sm text-gray-300">
                    <li><a href="{{ route('home') }}" class="hover:text-white">Home</a></li>
                    <li class="flex items-center space-x-2"><span class="text-gray-500">/</span>
                        <a href="{{ route('cart') }}" class="hover:text-white">Cart</a>
                    </li>
                    <li class="flex items-center space-x-2"><span class="text-gray-500">/</span>
                        <span class="text-white font-medium">Checkout</span>
                    </li>
                </ol>
            </nav>
            <div class="text-center">
                <h1 class="text-[28px] md:text-4xl font-[400] italic mb-2 text-white">Checkout</h1>
                <p class="text-[13px] md:text-base text-gray-300">Securely complete your purchase.</p>
            </div>
        </div>
    </section>

    <section class="bg-[#F5F0EB] min-h-screen py-10">
        <div class="max-w-6xl mx-auto px-4 md:px-8">

            @if ($errors->any())
                <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[13px] space-y-1">
                    @foreach ($errors->all() as $error)
                        <p>• {{ $error }}</p>
                    @endforeach
                </div>
            @endif

            <form method="POST" action="{{ route('order.place') }}">
                @csrf
                <div class="grid grid-cols-1 lg:grid-cols-[1fr_360px] gap-6">

                    <!-- LEFT -->
                    <div class="flex flex-col gap-6">

                        <!-- Saved Addresses -->
                        @if ($addresses->count() > 0)
                            <div class="bg-white rounded-xl border border-[#D6D6D6] p-6">
                                <h2 class="text-[16px] font-bold text-primary mb-4">Saved Addresses</h2>
                                <div class="space-y-3">
                                    @foreach ($addresses as $addr)
                                        <label
                                            class="flex items-start gap-3 border border-[#D6D6D6] rounded-lg p-3 cursor-pointer hover:border-brand transition-colors">
                                            <input type="radio" name="address_id" value="{{ $addr->id }}"
                                                class="accent-brand mt-1">
                                            <div>
                                                <p class="text-[14px] font-semibold text-primary">{{ $addr->first_name }}
                                                    {{ $addr->last_name }}</p>
                                                <p class="text-[12px] text-secondary">{{ $addr->street_address }},
                                                    {{ $addr->city }}, {{ $addr->state }} - {{ $addr->zip_code }}</p>
                                                <p class="text-[12px] text-secondary">{{ $addr->phone }}</p>
                                            </div>
                                        </label>
                                    @endforeach
                                </div>
                                <p class="text-[12px] text-secondary mt-3">Or fill a new address below:</p>
                            </div>
                        @endif

                        <!-- Shipping Address -->
                        <div class="bg-white rounded-xl border border-[#D6D6D6] p-6">
                            <h2 class="text-[16px] font-bold text-primary mb-5">Shipping Address</h2>
                            <div class="flex flex-col gap-4">

                                <div class="grid grid-cols-2 gap-4">
                                    <div class="relative">
                                        <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">First
                                            Name *</label>
                                        <input type="text" name="first_name"
                                            value="{{ old('first_name', Auth::user()->first_name) }}"
                                            class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                    </div>
                                    <div class="relative">
                                        <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Last
                                            Name *</label>
                                        <input type="text" name="last_name"
                                            value="{{ old('last_name', Auth::user()->last_name) }}"
                                            class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                    </div>
                                </div>

                                <div class="relative">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Email
                                        *</label>
                                    <input type="email" name="email" value="{{ old('email', Auth::user()->email) }}"
                                        class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                </div>

                                <div class="relative">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Phone
                                        *</label>
                                    <input type="tel" name="phone" value="{{ old('phone', Auth::user()->phone) }}"
                                        class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                </div>

                                <div class="relative">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Street
                                        Address *</label>
                                    <input type="text" name="street_address" value="{{ old('street_address') }}"
                                        class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                </div>

                                <div class="grid grid-cols-2 gap-4">
                                    <div class="relative">
                                        <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">State
                                            *</label>
                                        <select name="state"
                                            class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand appearance-none bg-white">
                                            <option value="">Select State</option>
                                            @foreach (['Rajasthan', 'Delhi', 'Maharashtra', 'Gujarat', 'Karnataka', 'Tamil Nadu', 'UP', 'West Bengal', 'Punjab', 'Haryana'] as $state)
                                                <option {{ old('state') == $state ? 'selected' : '' }}>{{ $state }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="relative">
                                        <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">City
                                            *</label>
                                        <input type="text" name="city" value="{{ old('city') }}"
                                            class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                    </div>
                                </div>

                                <div class="relative">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Zip Code
                                        *</label>
                                    <input type="text" name="zip_code" value="{{ old('zip_code') }}"
                                        class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand" />
                                </div>

                                <label class="flex items-center gap-2 text-[13px] text-secondary cursor-pointer">
                                    <input type="checkbox" name="save_address" value="1" class="accent-brand">
                                    Save this address for future orders
                                </label>

                                <div class="relative">
                                    <label class="absolute -top-2 left-3 bg-white px-1 text-[11px] text-secondary">Order
                                        Notes (Optional)</label>
                                    <textarea name="notes" rows="2"
                                        class="w-full border border-[#D6D6D6] rounded-lg px-4 py-3 text-[13px] text-primary outline-none focus:border-brand resize-none"></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Payment Method — COD only -->
                        <div class="bg-white rounded-xl border border-[#D6D6D6] p-6">
                            <h2 class="text-[16px] font-semibold text-primary mb-5">Payment Method</h2>

                            <label
                                class="flex items-center gap-3 border border-brand bg-brand/5 rounded-lg px-4 py-3.5 cursor-pointer">
                                <input type="radio" name="payment_method" value="cod" checked
                                    class="accent-brand w-4 h-4" />
                                <div>
                                    <span class="text-[14px] font-medium text-primary">Cash on Delivery</span>
                                    <p class="text-[11px] text-secondary">Pay when your order arrives</p>
                                </div>
                            </label>

                            {{-- Online payment - blurred/disabled --}}
                            <div class="mt-3 opacity-40 cursor-not-allowed relative">
                                <div class="flex items-center gap-3 border border-[#D6D6D6] rounded-lg px-4 py-3.5">
                                    <input type="radio" disabled class="w-4 h-4" />
                                    <div>
                                        <span class="text-[14px] font-medium text-primary">Online Payment</span>
                                        <p class="text-[11px] text-secondary">Credit/Debit Card, UPI — Coming Soon</p>
                                    </div>
                                </div>
                                <div class="absolute inset-0 bg-white/50 rounded-lg flex items-center justify-center">
                                    <span
                                        class="text-[11px] font-semibold text-secondary bg-white px-3 py-1 rounded-full border border-[#D6D6D6]">Coming
                                        Soon</span>
                                </div>
                            </div>

                            <div class="flex items-center gap-2 mt-4">
                                <svg class="w-4 h-4 text-secondary shrink-0" fill="none" stroke="currentColor"
                                    stroke-width="1.5" viewBox="0 0 24 24">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                                </svg>
                                <p class="text-[11px] text-secondary">Your information is secure and encrypted.</p>
                            </div>
                        </div>

                    </div>

                    <!-- Summary -->
                    <div class="flex flex-col gap-4">
                        <div class="bg-white rounded-xl border border-[#D6D6D6] p-5">

                            <h3 class="text-[15px] font-bold text-primary mb-4">Order Summary</h3>

                            <!-- Items -->
                            <!-- Items -->
                            <div class="space-y-3 mb-4">
                                @foreach ($cartItems as $item)
                                    <div class="flex items-center gap-3">
                                        <img src="{{ $item->product->primary_image_url }}"
                                            class="w-12 h-12 object-cover rounded" />
                                        <div class="flex-1">
                                            <p class="text-[12px] font-medium text-primary">{{ $item->product->name }}</p>
                                            <p class="text-[11px] text-secondary">{{ $item->quantity }} meters ×
                                                ₹{{ number_format($item->product->price, 2) }}</p>
                                            @if ($item->color)
                                                <p class="text-[10px] text-secondary">Color: {{ $item->color }}</p>
                                            @endif
                                        </div>
                                        <span
                                            class="text-[13px] font-bold text-primary">₹{{ number_format($item->product->price * $item->quantity, 2) }}</span>
                                    </div>
                                @endforeach
                            </div>

                            <hr class="border-[#D6D6D6] mb-3" />

                            <div class="flex flex-col gap-2 mb-4">
                                <div class="flex justify-between text-[13px]">
                                    <span class="text-secondary">Subtotal</span>
                                    <span class="text-primary">₹{{ number_format($subtotal, 2) }}</span>
                                </div>
                                <div class="flex justify-between text-[13px]">
                                    <span class="text-secondary">GST (18%)</span>
                                    <span class="text-primary">+₹{{ number_format($tax, 2) }}</span>
                                </div>
                                <hr class="border-[#D6D6D6]" />
                                <div class="flex justify-between">
                                    <span class="text-[15px] font-bold text-primary">Total</span>
                                    <span class="text-[15px] font-bold text-brand">₹{{ number_format($total, 2) }}</span>
                                </div>
                            </div>

                            <div class="flex flex-col gap-1.5 mb-5">
                                <p class="text-[12px] text-secondary">✓ Secure checkout</p>
                                <p class="text-[12px] text-secondary">✓ 30-day returns</p>
                                <p class="text-[12px] text-secondary">✓ Money-back guarantee</p>
                            </div>

                            <button type="submit"
                                class="w-full bg-brand text-white py-3.5 rounded-lg text-[14px] font-semibold hover:opacity-90 transition-opacity cursor-pointer text-center block">
                                Place Order (COD)
                            </button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </section>

@endsection
