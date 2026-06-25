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
                    My Account
                </h1>
                <p class="text-sm md:text-base text-gray-300">
                    Check your selected items and proceed to payment</p>
            </div>

        </div>

    </section>

    <!-- tab section  -->

    <section class="bg-white">
        <div class="max-w-8xl mx-auto px-4 md:px-8">
            <div class="flex gap-8" x-data="{
                tab: 'profile',
                showPass: false,
                showNewPass: false,
                showConfirmPass: false,
                orders: [{
                        id: '#FGFT333HGF',
                        total: '₹347.00',
                        method: 'Cash on delivery',
                        delivery: '24 Oct 2026',
                        status: 'Accepted',
                        items: [
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' },
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' },
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' }
                        ]
                    },
                    {
                        id: '#FGFT333HGF',
                        total: '₹347.00',
                        method: 'Cash on delivery',
                        delivery: '24 Oct 2026',
                        status: 'Accepted',
                        items: [
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' },
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' },
                            { name: 'Premium Cotton Weave', price: '₹347.00', img: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=80&h=80&fit=crop' }
                        ]
                    }
                ]
            }">

                <!-- ===== LEFT SIDEBAR ===== -->
                <div class="w-[200px] shrink-0">
                    <div class="flex flex-col gap-1">

                        <button @click="tab = 'profile'"
                            :class="tab === 'profile' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:user" width="16"></iconify-icon>
                            Personal Information
                        </button>

                        <button @click="tab = 'orders'"
                            :class="tab === 'orders' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:shopping-bag" width="16"></iconify-icon>
                            My Order
                        </button>

                        <button @click="tab = 'addresses'"
                            :class="tab === 'addresses' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:map-pin" width="16"></iconify-icon>
                            Addresses
                        </button>

                        <button @click="tab = 'wishlist'"
                            :class="tab === 'wishlist' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:heart" width="16"></iconify-icon>
                            Wishlist
                        </button>

                        {{-- <button @click="tab = 'payment'"
                            :class="tab === 'payment' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:credit-card" width="16"></iconify-icon>
                            Payment Method
                        </button> --}}

                        <button @click="tab = 'password'"
                            :class="tab === 'password' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:lock" width="16"></iconify-icon>
                            Password Change
                        </button>

                        <button @click="tab = 'logout'"
                            :class="tab === 'logout' ? 'bg-brand text-white' : 'text-brand hover:bg-brand/10'"
                            class="flex items-center gap-3 px-4 py-3 text-[14px] font-medium transition-colors text-left">
                            <iconify-icon icon="lucide:log-out" width="16"></iconify-icon>
                            Logout
                        </button>

                    </div>
                </div>

                <!-- ===== RIGHT CONTENT ===== -->
                <div class="flex-1 min-w-0">


                    <!-- ===== PERSONAL INFORMATION ===== -->
                    <div x-show="tab === 'profile'" x-cloak x-transition>

                        @if (session('success'))
                            <div class="mb-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">
                                ✓ {{ session('success') }}
                            </div>
                        @endif
                        @if ($errors->any())
                            <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[13px] space-y-1">
                                @foreach ($errors->all() as $error)
                                    <p>• {{ $error }}</p>
                                @endforeach
                            </div>
                        @endif

                        <form method="POST" action="{{ route('profile.update') }}">
                            @csrf

                            <div class="grid grid-cols-2 gap-5 mb-5">
                                <div>
                                    <label class="text-[16px] font-[500] text-black mb-1.5 block">First Name</label>
                                    <input type="text" name="first_name"
                                        value="{{ old('first_name', Auth::user()->first_name) }}"
                                        class="w-full bg-light px-3 py-2.5 text-[14px] text-primary outline-none focus:border-brand transition-colors" />
                                </div>
                                <div>
                                    <label class="text-[16px] font-[500] text-black mb-1.5 block">Last Name</label>
                                    <input type="text" name="last_name"
                                        value="{{ old('last_name', Auth::user()->last_name) }}"
                                        class="w-full bg-light px-3 py-2.5 text-[14px] text-primary outline-none focus:border-brand transition-colors" />
                                </div>
                            </div>

                            <div class="mb-5">
                                <label class="text-[16px] font-[500] text-black mb-1.5 block">Email</label>
                                <input type="email" name="email" value="{{ old('email', Auth::user()->email) }}"
                                    class="w-full bg-light px-3 py-2.5 text-[14px] text-primary outline-none focus:border-brand transition-colors" />
                            </div>

                            <div class="mb-5">
                                <label class="text-[16px] font-[500] text-black mb-1.5 block">Phone Number</label>
                                <input type="tel" name="phone" value="{{ old('phone', Auth::user()->phone) }}"
                                    class="w-full bg-light px-3 py-2.5 text-[14px] text-primary outline-none focus:border-brand transition-colors" />
                            </div>

                            <div class="mb-6">
                                <label class="text-[16px] font-[500] text-black mb-1.5 block">Gender</label>
                                <div class="relative">
                                    <select name="gender"
                                        class="w-full bg-light px-3 py-2.5 text-[14px] text-primary outline-none focus:border-brand transition-colors appearance-none">
                                        <option value="">Select</option>
                                        <option @selected(Auth::user()->gender === 'Male')>Male</option>
                                        <option @selected(Auth::user()->gender === 'Female')>Female</option>
                                        <option @selected(Auth::user()->gender === 'Other')>Other</option>
                                    </select>
                                    <iconify-icon icon="lucide:chevron-down"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary pointer-events-none"
                                        width="16"></iconify-icon>
                                </div>
                            </div>

                            <button
                                class="bg-brand text-white text-[14px] font-medium px-6 py-2.5 hover:opacity-90 transition-opacity">
                                Save Change
                            </button>

                        </form>
                    </div>
                    <!-- ===== MY ORDERS ===== -->
                    <div x-show="tab === 'orders'" x-cloak x-transition>
                        <div class="flex items-center justify-between mb-5">
                            <h3 class="text-[18px] font-semibold text-primary">Orders ({{ $orders->count() }})</h3>
                        </div>

                        @if ($orders->isEmpty())
                            <div class="text-center py-10 text-secondary">
                                <iconify-icon icon="lucide:shopping-bag" width="40"
                                    class="mb-3 opacity-30"></iconify-icon>
                                <p class="text-[14px]">No orders yet.</p>
                                <a href="{{ route('products') }}"
                                    class="text-brand text-[13px] hover:underline mt-2 inline-block">Start Shopping</a>
                            </div>
                        @else
                            <div class="space-y-4">
                                @foreach ($orders as $order)
                                    <div class="bg-white border border-border rounded-xl overflow-hidden">
                                        <div class="grid grid-cols-4 gap-4 bg-brand px-5 py-3">
                                            <div>
                                                <p class="text-[12px] text-white">Order ID</p>
                                                <p class="text-[13px] font-semibold text-white">#{{ $order->order_number }}
                                                </p>
                                            </div>
                                            <div>
                                                <p class="text-[12px] text-white">Total</p>
                                                <p class="text-[13px] font-semibold text-white">
                                                    ₹{{ number_format($order->total, 2) }}</p>
                                            </div>
                                            <div>
                                                <p class="text-[12px] text-white">Payment</p>
                                                <p class="text-[13px] font-semibold text-white">
                                                    {{ strtoupper($order->payment_method) }}</p>
                                            </div>
                                            <div>
                                                <p class="text-[12px] text-white">Date</p>
                                                <p class="text-[13px] font-semibold text-white">
                                                    {{ $order->created_at->format('d M Y') }}</p>
                                            </div>
                                        </div>

                                        <div class="px-5 py-3">
                                            @foreach ($order->items as $item)
                                                <div class="flex items-center gap-3 mb-3">
                                                    <img src="{{ $item->product_image }}"
                                                        class="w-12 h-12 object-cover rounded" />
                                                    <div>
                                                        <p class="text-[14px] font-[400] text-text">
                                                            {{ $item->product_name }}</p>
                                                        <p class="text-[12px] text-secondary">{{ $item->quantity }} meters
                                                            × ₹{{ $item->price }}</p>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>

                                        <div class="flex items-center justify-between px-5 py-3 border-t border-border">
                                            <div>
                                                <span
                                                    class="border border-brand rounded-full text-brand text-[12px] px-3 py-0.5">
                                                    {{ $order->status_label }}
                                                </span>
                                            </div>
                                            <div class="flex items-center gap-3">
                                                {{-- Invoice Download --}}
                                                <a href="{{ route('order.invoice', $order->id) }}" target="_blank"
                                                    class="border border-border text-primary text-[12px] font-medium px-4 py-1.5 rounded hover:border-brand hover:text-brand transition-colors flex items-center gap-1.5">
                                                    <iconify-icon icon="lucide:download" width="13"></iconify-icon>
                                                    Invoice
                                                </a>

                                                @if ($order->status === 'pending' || $order->status === 'accepted')
                                                    <span class="text-secondary text-[12px]">Cancel option coming
                                                        soon</span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    </div>
                    <!-- ===== ADDRESSES ===== -->
                    <div x-show="tab === 'addresses'" x-cloak x-transition>

                        @if (session('success'))
                            <div class="mb-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">✓
                                {{ session('success') }}</div>
                        @endif

                        <!-- Saved Addresses -->
                        @if ($addresses->count() > 0)
                            <div class="space-y-3 mb-8">
                                @foreach ($addresses as $addr)
                                    <div
                                        class="flex items-center justify-between bg-white border border-border rounded-xl px-5 py-4">
                                        <div>
                                            <p class="text-[14px] font-semibold text-primary">{{ $addr->first_name }}
                                                {{ $addr->last_name }}</p>
                                            <p class="text-[13px] text-secondary">{{ $addr->street_address }},
                                                {{ $addr->city }}, {{ $addr->state }} - {{ $addr->zip_code }}</p>
                                            <p class="text-[12px] text-secondary">{{ $addr->phone }}</p>
                                        </div>
                                        <form method="POST" action="{{ route('address.delete', $addr->id) }}">
                                            @csrf @method('DELETE')
                                            <button type="submit"
                                                class="text-[13px] text-red-500 hover:underline">Delete</button>
                                        </form>
                                    </div>
                                @endforeach
                            </div>
                        @endif

                        <!-- Add New Address -->
                        <h4 class="text-[18px] font-semibold text-primary mb-5">Add New Address</h4>
                        <form method="POST" action="{{ route('address.store') }}">
                            @csrf
                            <div class="grid grid-cols-2 gap-4 mb-4">
                                <div>
                                    <label class="text-[13px] font-medium text-primary mb-1.5 block">First Name <span
                                            class="text-red-400">*</span></label>
                                    <input type="text" name="first_name" placeholder="First Name"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                                </div>
                                <div>
                                    <label class="text-[13px] font-medium text-primary mb-1.5 block">Last Name <span
                                            class="text-red-400">*</span></label>
                                    <input type="text" name="last_name" placeholder="Last Name"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Email <span
                                        class="text-red-400">*</span></label>
                                <input type="email" name="email" placeholder="Email"
                                    value="{{ Auth::user()->email }}"
                                    class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                            </div>
                            <div class="mb-4">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Phone <span
                                        class="text-red-400">*</span></label>
                                <input type="tel" name="phone" placeholder="Phone"
                                    value="{{ Auth::user()->phone }}"
                                    class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                            </div>
                            <div class="mb-4">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Street Address <span
                                        class="text-red-400">*</span></label>
                                <input type="text" name="street_address" placeholder="Street Address"
                                    class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                            </div>
                            <div class="grid grid-cols-2 gap-4 mb-4">
                                <div>
                                    <label class="text-[13px] font-medium text-primary mb-1.5 block">City <span
                                            class="text-red-400">*</span></label>
                                    <input type="text" name="city" placeholder="City"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                                </div>
                                <div>
                                    <label class="text-[13px] font-medium text-primary mb-1.5 block">State <span
                                            class="text-red-400">*</span></label>
                                    <input type="text" name="state" placeholder="State"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                                </div>
                            </div>
                            <div class="mb-6">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Zip Code <span
                                        class="text-red-400">*</span></label>
                                <input type="text" name="zip_code" placeholder="Zip Code"
                                    class="w-full bg-light rounded px-3 py-2.5 text-[14px] outline-none focus:border-brand" />
                            </div>
                            <button type="submit"
                                class="bg-brand text-white text-[14px] font-medium px-6 py-2.5 rounded hover:opacity-90">
                                Add Address
                            </button>
                        </form>
                    </div>

                    <!-- ===== WISHLIST ===== -->
                    <div x-show="tab === 'wishlist'" x-cloak x-transition>
                        <h3 class="text-[18px] font-semibold text-primary mb-5">My Wishlist ({{ $wishlists->count() }})
                        </h3>

                        @if ($wishlists->isEmpty())
                            <div class="text-center py-10 text-secondary">
                                <iconify-icon icon="lucide:heart" width="40" class="mb-3 opacity-30"></iconify-icon>
                                <p class="text-[14px]">No items in wishlist yet.</p>
                                <a href="{{ route('products') }}"
                                    class="text-brand text-[13px] hover:underline mt-2 inline-block">Browse Products</a>
                            </div>
                        @else
                            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                                @foreach ($wishlists as $item)
                                    @if ($item->product)
                                        <div
                                            class="wishlist-card bg-white overflow-hidden border border-[#D6D6D6] relative group">
                                            <form method="POST"
                                                action="{{ route('wishlist.remove', $item->product->id) }}"
                                                class="absolute top-2 left-2 z-10">
                                                @csrf @method('DELETE')
                                                <button type="submit"
                                                    class="w-7 h-7 bg-white border border-[#D6D6D6] flex items-center justify-center text-primary hover:bg-red-50 hover:border-red-400 hover:text-red-500 transition-all shadow-sm">
                                                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor"
                                                        stroke-width="2.5" viewBox="0 0 24 24">
                                                        <path d="M18 6 6 18M6 6l12 12" />
                                                    </svg>
                                                </button>
                                            </form>

                                            <a href="{{ route('productdetail', $item->product->slug) }}">
                                                <div class="overflow-hidden">
                                                    <img src="{{ $item->product->primary_image_url }}"
                                                        class="w-full h-[180px] object-cover group-hover:scale-105 transition-transform duration-300" />
                                                </div>
                                            </a>

                                            <div class="p-3">
                                                <p
                                                    class="text-[10px] tracking-[2px] uppercase text-brand font-semibold mb-1">
                                                    {{ $item->product->productcategory->name }}</p>
                                                <h3 class="text-[14px] font-semibold text-primary mb-1">
                                                    {{ $item->product->name }}</h3>
                                                <p class="text-[12px] text-secondary leading-relaxed mb-3">
                                                    {{ Str::limit($item->product->short_description, 60) }}</p>
                                                <div class="flex items-center justify-between">
                                                    <span
                                                        class="text-[14px] font-bold text-primary">{{ $item->product->formatted_price }}</span>
                                                    <a href="{{ route('cart') }}"
                                                        class="w-8 h-8 bg-brand text-white flex items-center justify-center hover:opacity-90">
                                                        <svg class="w-4 h-4" fill="none" stroke="currentColor"
                                                            stroke-width="2" viewBox="0 0 24 24">
                                                            <circle cx="9" cy="21" r="1" />
                                                            <circle cx="20" cy="21" r="1" />
                                                            <path
                                                                d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        @endif
                    </div>

                    <!-- ===== PAYMENT METHOD ===== -->
                    {{-- <div x-show="tab === 'payment'" x-cloak x-transition>

                        <!-- Saved Cards -->
                        <div class="space-y-3 mb-6">
                            <div class="flex items-center justify-between bg-white border border-border px-5 py-4">
                                <div class="flex items-center gap-3">
                                    <iconify-icon icon="logos:visa" width="40"></iconify-icon>
                                    <span class="text-[14px] font-medium text-primary">**** **** **** 8969</span>
                                </div>
                                <button class="text-[13px] text-red-500 hover:underline">Delete</button>
                            </div>
                            <div class="flex items-center justify-between bg-white border border-border px-5 py-4">
                                <div class="flex items-center gap-3">
                                    <iconify-icon icon="logos:google-icon" width="20"></iconify-icon>
                                    <span class="text-[14px] font-medium text-primary">Google Pay</span>
                                </div>
                                <button class="text-[13px] text-brand hover:underline">Link Account</button>
                            </div>
                        </div>

                        <!-- Add New Card -->
                        <div class="bg-white border border-border p-5">

                            <!-- Header -->
                            <div class="flex items-center justify-between mb-5">
                                <div class="flex items-center gap-2">
                                    <input type="radio" checked class="accent-brand w-4 h-4" />
                                    <span class="text-[14px] font-medium text-primary">Add New Credit Card</span>
                                </div>
                                <div class="flex items-center gap-2">
                                    <iconify-icon icon="logos:visa" width="40"></iconify-icon>
                                    <iconify-icon icon="logos:discover" width="40"></iconify-icon>
                                    <iconify-icon icon="logos:mastercard" width="36"></iconify-icon>
                                    <iconify-icon icon="logos:mastercard" width="36"></iconify-icon>
                                </div>
                            </div>

                            <!-- Row 1: Card Number | Expiration Date -->
                            <div class="grid grid-cols-2 gap-4 mb-4">
                                <div>
                                    <label class="text-[11px] text-secondary mb-1 block">Card number</label>
                                    <div class="relative">
                                        <input type="text" placeholder="1234 5678 9101 3456"
                                            class="w-full bg-white border-2 border-brand rounded px-3 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none transition-colors pr-10" />
                                        <iconify-icon icon="lucide:check-circle"
                                            class="absolute right-3 top-1/2 -translate-y-1/2 text-brand"
                                            width="18"></iconify-icon>
                                    </div>
                                </div>
                                <div>
                                    <label class="text-[11px] text-secondary mb-1 block">Expiration Date</label>
                                    <input type="text" placeholder="MM/YY"
                                        class="w-full bg-white border border-border rounded px-3 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                            </div>

                            <!-- Row 2: Card Security Code | What is this -->
                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <label class="text-[11px] text-secondary mb-1 block">Card Security Code</label>
                                    <input type="password" placeholder="***"
                                        class="w-full bg-white border border-border rounded px-3 py-3 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                </div>
                                <div class="flex items-end pb-3">
                                    <a href="#" class="text-[13px] text-brand hover:underline">What is this?</a>
                                </div>
                            </div>

                        </div>

                        <button
                            class="mt-4 bg-brand text-white text-[14px] font-medium px-6 py-2.5 rounded hover:opacity-90 transition-opacity">
                            Add New Card
                        </button>
                    </div> --}}


                    <!-- ===== PASSWORD CHANGE ===== -->
                    <div x-show="tab === 'password'" x-cloak x-transition>

                        @if (session('password_success'))
                            <div class="mb-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">
                                ✓ {{ session('password_success') }}
                            </div>
                        @endif
                        @if ($errors->has('current_password'))
                            <div class="mb-4 p-3 bg-red-50 border border-red-200 text-red-700 text-[13px]">
                                • {{ $errors->first('current_password') }}
                            </div>
                        @endif

                        <form method="POST" action="{{ route('password.update') }}">
                            @csrf

                            <div class="mb-5">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Current Password <span
                                        class="text-red-400">*</span></label>
                                <div class="relative">
                                    <input name="current_password" :type="showPass ? 'text' : 'password'"
                                        placeholder="Enter Current Password"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors pr-10" />
                                    <button type="button" @click="showPass = !showPass"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                        <iconify-icon :icon="showPass ? 'lucide:eye-off' : 'lucide:eye'"
                                            width="16"></iconify-icon>
                                    </button>
                                </div>
                            </div>

                            <div class="mb-5">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">New Password</label>
                                <div class="relative">
                                    <input name="password" :type="showNewPass ? 'text' : 'password'"
                                        placeholder="Enter New Password"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors pr-10" />
                                    <button type="button" @click="showNewPass = !showNewPass"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                        <iconify-icon :icon="showNewPass ? 'lucide:eye-off' : 'lucide:eye'"
                                            width="16"></iconify-icon>
                                    </button>
                                </div>
                            </div>

                            <div class="mb-6">
                                <label class="text-[13px] font-medium text-primary mb-1.5 block">Confirm Password</label>
                                <div class="relative">
                                    <input name="password_confirmation" :type="showConfirmPass ? 'text' : 'password'"
                                        placeholder="Confirm New Password"
                                        class="w-full bg-light rounded px-3 py-2.5 text-[14px] placeholder:text-placeholder outline-none focus:border-brand transition-colors pr-10" />
                                    <button type="button" @click="showConfirmPass = !showConfirmPass"
                                        class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                                        <iconify-icon :icon="showConfirmPass ? 'lucide:eye-off' : 'lucide:eye'"
                                            width="16"></iconify-icon>
                                    </button>
                                </div>
                            </div>

                            <button
                                class="bg-brand text-white text-[14px] font-medium px-6 py-2.5 rounded hover:opacity-90 transition-opacity">
                                Update Password
                            </button>

                        </form>
                    </div>

                    <!-- ===== LOGOUT ===== -->
                    <div x-show="tab === 'logout'" x-cloak x-transition>
                        <h3 class="text-[22px] font-bold text-primary mb-1">Logout</h3>
                        <p class="text-[14px] text-secondary mb-5">Are you sure you want to logout?</p>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit"
                                class="bg-brand text-white text-[14px] font-medium px-6 py-2.5 rounded hover:opacity-90 transition-opacity">
                                Yes, Logout
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </section>


@endsection
