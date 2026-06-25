<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heritage Textiles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ url('assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ url('assets/css/responsive.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.14.1/dist/cdn.min.js"></script>
    <style>
        [x-cloak] { display: none !important; }
    </style>
    <style type="text/tailwindcss">
        @theme {
            --color-brand: #C6A75E;
            --color-primary: #131313;
            --color-secondary: #787878;
            --color-placeholder: #787878;
            --color-light: #F8F5EE;
            --color-border: #D6D6D6;
            --color-text: #404040;
            --color-surface: #F5F5F5;
            --width-8xl: 88rem;
        }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
        [x-cloak] { display: none !important; }
    </style>
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>

<body>

<header id="main-header" class="bg-white border-b border-border sticky top-0 z-50"
    x-cloak x-data="{ mobileMenu: false, searchOpen: false }">

    <!-- ROW 1 -->
    <div class="flex items-center gap-4 justify-between px-5 md:px-10 py-3 border-b border-border">

        <!-- Logo -->
        <a href="{{ url('/') }}" class="shrink-0">
            <img src="{{ url('assets/images/logo.png') }}" alt="Heritage Textiles" class="h-10 w-auto" />
        </a>

        <!-- Search Bar desktop -->
        <div class="flex-1 hidden md:flex items-center bg-surface border border-border rounded-full px-4 py-2 gap-3 max-w-full">
            <svg class="w-4 h-4 text-secondary shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
            </svg>
            <input type="text" placeholder="Search for products, brands & more..."
                class="bg-transparent outline-none text-sm text-primary placeholder:text-placeholder w-full" />
        </div>

        <div class="flex-1 md:hidden"></div>

        <!-- Mobile Search Icon -->
        <button class="md:hidden text-secondary hover:text-brand" @click="searchOpen = !searchOpen">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
            </svg>
        </button>

        <!-- Desktop Actions -->
        <div class="hidden md:flex items-center gap-5">

            <!-- Wishlist -->
            <a href="{{ route('wishlist') }}"
                class="flex items-center gap-1.5 text-primary hover:text-brand transition-colors relative">
                <div class="relative">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                    <span id="wishlistCount"
                        class="absolute -top-2 -right-2 w-4 h-4 bg-brand text-white text-[10px] font-bold rounded-full items-center justify-center {{ $wishlistCount > 0 ? 'flex' : 'hidden' }}">
                        {{ $wishlistCount }}
                    </span>
                </div>
                <span class="text-[16px] font-[400]">Wishlist</span>
            </a>

            <!-- Cart -->
            <a href="{{ route('cart') }}"
                class="flex items-center gap-1.5 text-primary hover:text-brand transition-colors relative">
                <div class="relative">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                    </svg>
                    <span id="cartCount"
                        class="absolute -top-2 -right-2 w-4 h-4 bg-brand text-white text-[10px] font-bold rounded-full items-center justify-center {{ $cartCount > 0 ? 'flex' : 'hidden' }}">
                        {{ $cartCount }}
                    </span>
                </div>
                <span class="text-[16px] font-[400]">Cart</span>
            </a>

            <!-- Auth -->
            @guest
                <a href="{{ url('login') }}"
                    class="bg-brand text-white text-[12px] font-[400] px-5 py-1.5 hover:opacity-90 transition-opacity">Login</a>
                <a href="{{ url('register') }}"
                    class="border border-brand text-brand text-[12px] font-[400] px-5 py-1.5 hover:bg-brand hover:text-white transition-all">Signup</a>
            @else
                <a href="{{ route('account') }}"
                    class="flex items-center gap-2 border border-brand text-brand text-[12px] font-[400] px-5 py-1.5 hover:bg-brand hover:text-white transition-all">
                    <iconify-icon icon="lucide:user" width="14"></iconify-icon>
                    {{ Auth::user()->first_name }}
                </a>
            @endguest

            <!-- Currency -->
            <div class="border-l border-border pl-5" x-data="{ cur: 'INR' }">
                <div class="flex items-center bg-light rounded-full p-0.5 text-xs">
                    <button @click="cur = 'INR'"
                        :class="cur === 'INR' ? 'bg-brand text-white font-semibold' : 'text-secondary hover:text-primary'"
                        class="px-3 py-1.5 rounded-full transition-all duration-200">₹ INR</button>
                    <button @click="cur = 'USD'"
                        :class="cur === 'USD' ? 'bg-brand text-white font-semibold' : 'text-secondary hover:text-primary'"
                        class="px-3 py-1.5 rounded-full transition-all duration-200">$ USD</button>
                </div>
            </div>
        </div>

        <!-- Mobile Hamburger -->
        <button class="md:hidden text-secondary hover:text-brand ml-1" @click="mobileMenu = true">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path d="M4 6h16M4 12h16M4 18h16"/>
            </svg>
        </button>
    </div>

    <!-- Mobile Search -->
    <div x-cloak x-show="searchOpen" x-transition class="md:hidden px-4 py-2 border-b border-border">
        <div class="flex items-center bg-surface border border-border rounded-md px-4 py-2 gap-3">
            <svg class="w-4 h-4 text-secondary shrink-0" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
            </svg>
            <input type="text" placeholder="Search products..."
                class="bg-transparent outline-none text-sm text-primary placeholder:text-placeholder w-full" />
        </div>
    </div>

    <!-- ROW 2 — Dynamic Categories -->
    <div class="flex items-center px-5 md:px-10 gap-3 overflow-visible no-scrollbar">

        {{-- All Dropdown --}}
        <div class="relative shrink-0 py-2" x-data="{ catOpen: false }">
            <button @click="catOpen = !catOpen"
                class="flex items-center gap-2 bg-brand rounded px-3 py-1.5 text-white text-[15px] font-[500] transition-colors">
                All
                <svg class="w-3 h-3 transition-transform" :class="catOpen ? 'rotate-180' : ''"
                    fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path d="m6 9 6 6 6-6"/>
                </svg>
            </button>
            <div x-cloak x-show="catOpen" @click.outside="catOpen=false" x-transition
                class="absolute left-0 top-full mt-1 bg-white border border-gray-200 rounded-md w-48 z-[999] shadow-xl overflow-hidden">
                <a href="{{ route('products') }}"
                    class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50 font-medium">
                    All Products
                </a>
                @foreach($headerCategories as $cat)
                    <a href="{{ route('products', ['category' => $cat->slug]) }}"
                        class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50">
                        {{ $cat->name }}
                    </a>
                @endforeach
            </div>
        </div>

        {{-- Category Tags --}}
        <div class="flex items-center gap-0 overflow-x-auto no-scrollbar divide-x divide-border border-l border-border">
            <a href="{{ route('products') }}"
                class="text-primary text-[15px] font-[500] px-4 py-2.5 shrink-0 hover:text-brand transition-colors whitespace-nowrap">
                New Arrival
            </a>
            @foreach($headerCategories as $cat)
                <a href="{{ route('products', ['category' => $cat->slug]) }}"
                    class="text-primary text-[15px] font-[500] px-4 py-2.5 shrink-0 hover:text-brand transition-colors whitespace-nowrap">
                    {{ $cat->name }}
                </a>
            @endforeach
        </div>

    </div>

    <!-- MOBILE DRAWER -->
    <div x-cloak x-show="mobileMenu" class="fixed inset-0 z-50 md:hidden"
        x-transition:enter="transition-opacity duration-300" x-transition:enter-start="opacity-0"
        x-transition:enter-end="opacity-100" x-transition:leave="transition-opacity duration-300"
        x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">

        <div class="absolute inset-0 bg-black/70" @click="mobileMenu = false"></div>

        <div class="absolute left-0 top-0 h-full w-80 bg-white flex flex-col overflow-y-auto"
            x-transition:enter="transition-transform duration-300" x-transition:enter-start="-translate-x-full"
            x-transition:enter-end="translate-x-0" x-transition:leave="transition-transform duration-300"
            x-transition:leave-start="translate-x-0" x-transition:leave-end="-translate-x-full">

            <!-- Drawer Header -->
            <div class="flex items-center justify-between px-5 py-4 border-b border-gray-100 sticky top-0 bg-white z-10">
                <a href="{{ url('/') }}">
                    <img src="{{ url('assets/images/logo.png') }}" alt="Heritage Textiles" class="h-8 w-auto" />
                </a>
                <button @click="mobileMenu = false" class="text-secondary hover:text-brand p-1">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M18 6 6 18M6 6l12 12"/>
                    </svg>
                </button>
            </div>

            <!-- Auth section -->
            @guest
                <div class="flex gap-3 px-5 py-4 border-b border-gray-100">
                    <a href="{{ url('login') }}"
                        class="flex-1 text-center bg-brand text-white text-sm font-semibold py-2.5 rounded hover:opacity-90">Login</a>
                    <a href="{{ url('register') }}"
                        class="flex-1 text-center border border-brand text-brand text-sm py-2.5 rounded hover:bg-brand hover:text-white transition-all">Signup</a>
                </div>
            @else
                <div class="flex items-center justify-between px-5 py-4 border-b border-gray-100">
                    <div class="flex items-center gap-3">
                        <div class="w-8 h-8 rounded-full bg-brand text-white flex items-center justify-center text-sm font-bold">
                            {{ strtoupper(substr(Auth::user()->first_name, 0, 1)) }}
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-primary">
                                {{ Auth::user()->first_name }} {{ Auth::user()->last_name }}
                            </p>
                            <p class="text-[11px] text-secondary">
                                {{ Auth::user()->account_type === 'wholesale' ? 'Wholesale Buyer' : 'Retail Customer' }}
                            </p>
                        </div>
                    </div>
                    <a href="{{ route('account') }}" class="text-brand text-[12px] font-semibold">My Account</a>
                </div>
            @endguest

            <!-- Wishlist + Cart -->
            <div class="flex border-b border-gray-100">
                <a href="{{ route('wishlist') }}"
                    class="flex-1 flex items-center justify-center gap-2 py-3.5 text-secondary hover:text-brand hover:bg-gray-50 transition-colors border-r border-gray-100">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                    <span class="text-sm text-primary">
                        Wishlist {{ $wishlistCount > 0 ? "($wishlistCount)" : '' }}
                    </span>
                </a>
                <a href="{{ route('cart') }}"
                    class="flex-1 flex items-center justify-center gap-2 py-3.5 text-secondary hover:text-brand hover:bg-gray-50 transition-colors">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                        <circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                    </svg>
                    <span class="text-sm text-primary">
                        Cart {{ $cartCount > 0 ? "($cartCount)" : '' }}
                    </span>
                </a>
            </div>

            <!-- Nav -->
            <nav class="flex flex-col px-0 py-2 flex-1">

                <a href="{{ url('/') }}"
                    class="flex items-center justify-between px-5 py-3.5 text-sm text-primary hover:text-brand hover:bg-gray-50 transition-colors border-b border-gray-100">
                    Home
                    <svg class="w-4 h-4 text-secondary/40" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6"/>
                    </svg>
                </a>

                <!-- Categories Accordion — Dynamic -->
                <div x-data="{ open: false }" class="border-b border-gray-100">
                    <button @click="open = !open"
                        class="w-full flex items-center justify-between px-5 py-3.5 text-sm text-primary hover:text-brand hover:bg-gray-50 transition-colors">
                        <span>Categories</span>
                        <svg class="w-4 h-4 transition-transform" :class="open ? 'rotate-180' : ''"
                            fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path d="m6 9 6 6 6-6"/>
                        </svg>
                    </button>
                    <div x-cloak x-show="open" x-transition class="bg-gray-50 pb-1">
                        <a href="{{ route('products') }}"
                            class="flex items-center gap-2 px-8 py-2.5 text-sm text-secondary hover:text-brand hover:bg-gray-100 transition-colors">
                            <span class="w-1 h-1 rounded-full bg-brand/50"></span> All Products
                        </a>
                        @foreach($headerCategories as $cat)
                            <a href="{{ route('products', ['category' => $cat->slug]) }}"
                                class="flex items-center gap-2 px-8 py-2.5 text-sm text-secondary hover:text-brand hover:bg-gray-100 transition-colors">
                                <span class="w-1 h-1 rounded-full bg-brand/50"></span> {{ $cat->name }}
                            </a>
                        @endforeach
                    </div>
                </div>

                <a href="{{ route('contact') }}"
                    class="flex items-center justify-between px-5 py-3.5 text-sm text-primary hover:text-brand hover:bg-gray-50 transition-colors border-b border-gray-100">
                    Contact
                    <svg class="w-4 h-4 text-secondary/40" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6"/>
                    </svg>
                </a>

                @auth
                <form method="POST" action="{{ route('logout') }}" class="border-t border-gray-100 mt-auto">
                    @csrf
                    <button type="submit"
                        class="w-full text-left px-5 py-3.5 text-[13px] text-red-500 hover:bg-red-50 transition-colors flex items-center gap-2">
                        <iconify-icon icon="lucide:log-out" width="14"></iconify-icon>
                        Logout
                    </button>
                </form>
                @endauth

            </nav>

            <!-- Currency -->
            <div class="px-5 py-4 border-t border-gray-100" x-data="{ cur: '₹ INR' }">
                <p class="text-xs text-secondary/70 mb-2 uppercase tracking-wider">Currency</p>
                <div class="flex gap-2">
                    <button @click="cur='₹ INR'"
                        :class="cur == '₹ INR' ? 'bg-brand text-white' : 'border border-gray-200 text-secondary'"
                        class="flex-1 text-sm py-2 rounded font-medium transition-all">₹ INR</button>
                    <button @click="cur='$ USD'"
                        :class="cur == '$ USD' ? 'bg-brand text-white' : 'border border-gray-200 text-secondary'"
                        class="flex-1 text-sm py-2 rounded font-medium transition-all">$ USD</button>
                    <button @click="cur='€ EUR'"
                        :class="cur == '€ EUR' ? 'bg-brand text-white' : 'border border-gray-200 text-secondary'"
                        class="flex-1 text-sm py-2 rounded font-medium transition-all">€ EUR</button>
                </div>
            </div>

        </div>
    </div>

</header>

<script>
function updateCartCount(count) {
    const el = document.getElementById('cartCount');
    if (!el) return;
    el.textContent = count;
    el.classList.toggle('hidden', count <= 0);
    el.classList.toggle('flex', count > 0);
}

function updateWishlistCount(count) {
    const el = document.getElementById('wishlistCount');
    if (!el) return;
    el.textContent = count;
    el.classList.toggle('hidden', count <= 0);
    el.classList.toggle('flex', count > 0);
}

function showToast(message, type = 'success') {
    const toast = document.createElement('div');
    toast.className = `fixed bottom-5 right-5 z-[9999] px-5 py-3 rounded-lg text-white text-[13px] font-medium shadow-lg
        ${type === 'success' ? 'bg-green-600' : 'bg-red-500'}`;
    toast.textContent = message;
    document.body.appendChild(toast);
    setTimeout(() => toast.remove(), 3000);
}

function addToCart(productId) {
    const qtyEl = document.getElementById('qty');
    const qty   = qtyEl ? parseInt(qtyEl.textContent) : 1;
    const color = document.querySelector('.color-btn.bg-primary')?.textContent?.trim() || null;

    fetch('{{ route("cart.add") }}', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ product_id: productId, quantity: qty, color: color })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === 'success') {
            updateCartCount(data.count);
            showToast(data.message, 'success');
        } else if (data.status === 'login_required') {
            window.location.href = '/login';
        }
    });
}

function updateWishlistUI(added, count) {
    updateWishlistCount(count);
    showToast(added ? 'Added to wishlist!' : 'Removed from wishlist!', 'success');
}
</script>
