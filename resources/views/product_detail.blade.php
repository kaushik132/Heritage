@extends('dashboard.layout.main')
@section('content')

    <style>
        .zoom-lens {
            display: none;
            position: absolute;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 2px solid #C6A75E;
            background: rgba(198, 167, 94, 0.12);
            pointer-events: none;
            z-index: 20;
        }
    </style>

    @php
        $imagesByColor = $product->imagesByColor();
        $allImages = $product->images->map(fn($img) => ['url' => $img->url, 'color' => $img->color ?? 'default']);
    @endphp

    <!-- ===================== PRODUCT DETAIL SECTION ===================== -->
    <section class="bg-light">
        <div class="max-w-7xl mx-auto px-4 md:px-8">

            <!-- Breadcrumb -->
            <p class="text-[12px] text-secondary mb-6">
                <a href="{{ route('home') }}" class="hover:text-primary">Home</a> /
                <a href="{{ route('products') }}" class="hover:text-primary">All Products</a> /
                <span class="text-primary">{{ $product->name }}</span>
            </p>

            {{-- x-data GRID pe lagao — dono columns share karenge --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-10" x-data="productGallery()" x-init="init()">

                <!-- LEFT: Images -->
                <div class="relative">
                    <div class="relative overflow-hidden bg-white">
                        <div class="zoom-wrap relative block" id="mainZoomWrap">
                            <img :src="activeImage" id="mainImage" alt="{{ $product->name }}"
                                class="zoom-img w-full h-[300px] md:h-[573px] object-cover block cursor-crosshair"
                                @mousemove="handleZoom($event)" @mouseleave="hideZoom()" @mouseenter="showZoom()" />
                            <div class="zoom-lens" id="zoomLens"></div>
                        </div>
                    </div>

                    <!-- Thumb Strip -->
                    <div class="flex gap-2 mt-3 overflow-x-auto pb-1">
                        <template x-for="(img, index) in activeImages" :key="index">
                            <img :src="img.url" @click="activeImage = img.url; activeIndex = index"
                                :class="activeIndex === index ? 'border-brand' : 'border-transparent'"
                                class="w-[calc(25%-6px)] shrink-0 h-[75px] object-cover border-2 cursor-pointer hover:border-brand transition-all" />
                        </template>
                    </div>
                </div>

                <!-- RIGHT: Details -->
                <div>
                    <p class="text-[11px] tracking-[3px] uppercase text-brand font-semibold mb-2">
                        {{ $product->productcategory->name }}
                    </p>
                    <h1 class="font-['DM_Serif_Display'] text-[32px] italic text-primary leading-tight mb-3">
                        {{ $product->name }}
                    </h1>

                    <!-- Stars -->
                    <div class="flex items-center gap-1 mb-4">
                        @for ($i = 1; $i <= 5; $i++)
                            @if ($i <= floor($product->rating))
                                <svg class="w-4 h-4 fill-brand" viewBox="0 0 24 24">
                                    <path
                                        d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                                </svg>
                            @else
                                <svg class="w-4 h-4 text-[#D6D6D6]" fill="none" stroke="currentColor" stroke-width="1.5"
                                    viewBox="0 0 24 24">
                                    <path
                                        d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                                </svg>
                            @endif
                        @endfor
                        <span class="text-[12px] text-secondary ml-1">
                            {{ $product->rating }} out of 5 ({{ $product->review_count }} reviews)
                        </span>
                    </div>

                    <!-- Price -->
                    <div class="flex items-baseline gap-1 mb-1">
                        <span class="text-[20px] font-semibold text-primary">₹</span>
                        <span class="text-[28px] font-bold text-primary">{{ number_format($product->price, 2) }}</span>
                        <span class="text-[13px] text-secondary">/ per meter</span>
                    </div>
                    <p class="text-[11px] text-secondary mb-1">Inclusive of all taxes</p>
                    <p class="text-[12px] {{ $product->in_stock ? 'text-green-700' : 'text-red-500' }} font-medium mb-4">
                        {{ $product->in_stock ? '✓ In Stock · Ships within 2-3 days' : '✗ Out of Stock' }}
                    </p>

                    <hr class="border-[#D6D6D6] mb-4" />
                    <p class="text-[13px] text-secondary mb-4">Wholesale pricing available for bulk orders</p>

                    <!-- Colors -->
                    @if ($product->colors && count($product->colors) > 0)
                        <p class="text-[13px] font-medium text-primary mb-2">Select Color:</p>
                        <div class="flex flex-wrap gap-2 mb-4">
                            @foreach ($product->colors as $color)
                                <button @click="selectColor('{{ $color }}')"
                                    :class="activeColor === '{{ $color }}'
                                        ?
                                        'border-primary bg-primary text-white' :
                                        'border-[#D1D5DB] text-primary hover:border-secondary'"
                                    class="color-btn px-4 py-1.5 border-[1.5px] text-[13px] transition-all">
                                    {{ $color }}
                                </button>
                            @endforeach
                        </div>
                    @endif

                    <!-- Quantity -->
                    <p class="text-[13px] font-medium text-primary mb-2">Quantity (meters)</p>
                    <div class="flex items-center border-[1.5px] border-[#D1D5DB] w-fit overflow-hidden mb-5">
                        <button onclick="chQty(-1, {{ $product->moq }})"
                            class="w-9 h-9 flex items-center justify-center text-xl text-primary hover:bg-[#f7e5baa8] transition-colors">−</button>
                        <span id="qty"
                            class="min-w-[50px] text-center text-[14px] font-semibold text-primary border-x-[1.5px] border-[#D1D5DB] h-9 flex items-center justify-center">
                            {{ $product->moq }}
                        </span>
                        <button onclick="chQty(1, {{ $product->moq }})"
                            class="w-9 h-9 flex items-center justify-center text-xl text-primary hover:bg-[#f7e5baa8] transition-colors">+</button>
                    </div>

                    <!-- Action Buttons -->
                    <div class="grid grid-cols-2 gap-3 mb-3">
                        @auth
                            <button onclick="addToCart({{ $product->id }})"
                                class="cursor-pointer bg-primary text-white py-3 text-[14px] font-semibold hover:bg-[#2a2a2a] transition-colors text-center block w-full">
                                Add to Cart
                            </button>
                        @else
                            <a href="{{ route('login') }}"
                                class="cursor-pointer bg-primary text-white py-3 text-[14px] font-semibold hover:bg-[#2a2a2a] transition-colors text-center block">
                                Login to Add to Cart
                            </a>
                        @endauth

                        <button onclick="openModal('bulkModal')"
                            class="cursor-pointer bg-brand text-white py-3 text-[14px] font-semibold hover:opacity-90 transition-opacity">
                            Inquiry
                        </button>
                    </div>

                    @auth
                        <script>
                            function addToCart(productId) {
                                const qty = parseInt(document.getElementById('qty').textContent);
                                const color = document.querySelector('.color-btn.bg-primary')?.textContent?.trim() || null;
                                fetch('{{ route('cart.add') }}', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/json',
                                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                        },
                                        body: JSON.stringify({
                                            product_id: productId,
                                            quantity: qty,
                                            color: color
                                        })
                                    })
                                    .then(res => res.json())
                                    .then(data => {
                                        if (data.status === 'success') {
                                            showToast(data.message);
                                        } else if (data.status === 'login_required') {
                                            window.location.href = '{{ route('login') }}';
                                        }
                                    });
                            }
                        </script>
                    @endauth

                    <!-- Wishlist + Share — alag x-data -->
                    <div class="grid grid-cols-2 gap-3 mb-5" x-data="{ shareOpen: false }">

                        {{-- Wishlist Button --}}
                        @auth
                            @php
                                $isWishlisted = Auth::user()->wishlists->where('product_id', $product->id)->count() > 0;
                            @endphp
                            <form method="POST" action="{{ route('wishlist.toggle', $product->id) }}">
                                @csrf
                                <button type="submit"
                                    class="w-full border-[1.5px] {{ $isWishlisted ? 'border-brand text-brand' : 'border-[#D1D5DB] text-primary' }} py-2.5 text-[13px] font-medium hover:border-brand hover:text-brand transition-colors flex items-center justify-center gap-2 cursor-pointer">
                                    <svg class="w-4 h-4 {{ $isWishlisted ? 'fill-brand stroke-brand' : 'fill-none stroke-current' }}"
                                        stroke-width="1.8" viewBox="0 0 24 24">
                                        <path
                                            d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
                                    </svg>
                                    {{ $isWishlisted ? 'Wishlisted' : 'Wishlist' }}
                                </button>
                            </form>
                        @else
                            <a href="{{ route('login') }}"
                                class="border-[1.5px] border-[#D1D5DB] text-primary py-2.5 text-[13px] font-medium hover:border-brand hover:text-brand transition-colors flex items-center justify-center gap-2">
                                <svg class="w-4 h-4 fill-none stroke-current" stroke-width="1.8" viewBox="0 0 24 24">
                                    <path
                                        d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
                                </svg>
                                Wishlist
                            </a>
                        @endauth

                        {{-- Share Button --}}
                        <a href="#" @click.prevent="shareOpen = true"
                            class="border-[1.5px] border-[#D1D5DB] text-primary py-2.5 text-[13px] font-medium hover:border-brand transition-colors flex items-center justify-center gap-2">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.8"
                                viewBox="0 0 24 24">
                                <circle cx="18" cy="5" r="3" />
                                <circle cx="6" cy="12" r="3" />
                                <circle cx="18" cy="19" r="3" />
                                <line x1="8.59" y1="13.51" x2="15.42" y2="17.49" />
                                <line x1="15.41" y1="6.51" x2="8.59" y2="10.49" />
                            </svg>
                            Share
                        </a>

                        {{-- Share Modal --}}
                        <div x-show="shareOpen" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-5"
                            x-transition:enter="transition-opacity duration-300" x-transition:enter-start="opacity-0"
                            x-transition:enter-end="opacity-100" x-transition:leave="transition-opacity duration-300"
                            x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">
                            <div class="absolute inset-0 bg-black/50" @click="shareOpen = false"></div>
                            <div class="relative bg-white rounded-xl shadow-2xl w-[340px] p-6 z-10"
                                x-transition:enter="transition-all duration-300"
                                x-transition:enter-start="opacity-0 scale-95"
                                x-transition:enter-end="opacity-100 scale-100">
                                <div class="flex items-center justify-between mb-5">
                                    <h3 class="text-[18px] font-semibold text-primary">Share this Product</h3>
                                    <button @click="shareOpen = false" class="text-secondary hover:text-primary">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2"
                                            viewBox="0 0 24 24">
                                            <path d="M18 6 6 18M6 6l12 12" />
                                        </svg>
                                    </button>
                                </div>
                                <div class="grid grid-cols-4 gap-3 mb-5">
                                    <a href="https://wa.me/?text=Check this product: {{ urlencode(request()->url()) }}"
                                        target="_blank" class="flex flex-col items-center gap-1.5 group">
                                        <div
                                            class="w-12 h-12 rounded-full bg-green-50 flex items-center justify-center group-hover:bg-green-100">
                                            <svg class="w-6 h-6 fill-green-500" viewBox="0 0 24 24">
                                                <path
                                                    d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 0 1-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 0 1-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 0 1 2.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0 0 12.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 0 0 5.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 0 0-3.48-8.413z" />
                                            </svg>
                                        </div>
                                        <span class="text-[11px] text-secondary">WhatsApp</span>
                                    </a>
                                    <a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode(request()->url()) }}"
                                        target="_blank" class="flex flex-col items-center gap-1.5 group">
                                        <div
                                            class="w-12 h-12 rounded-full bg-blue-50 flex items-center justify-center group-hover:bg-blue-100">
                                            <svg class="w-6 h-6 fill-blue-600" viewBox="0 0 24 24">
                                                <path
                                                    d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                            </svg>
                                        </div>
                                        <span class="text-[11px] text-secondary">Facebook</span>
                                    </a>
                                    <a href="https://www.instagram.com/" target="_blank"
                                        class="flex flex-col items-center gap-1.5 group">
                                        <div
                                            class="w-12 h-12 rounded-full bg-pink-50 flex items-center justify-center group-hover:bg-pink-100">
                                            <svg class="w-6 h-6 fill-pink-500" viewBox="0 0 24 24">
                                                <path
                                                    d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 1 0 0 12.324 6.162 6.162 0 0 0 0-12.324zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.406-11.845a1.44 1.44 0 1 0 0 2.881 1.44 1.44 0 0 0 0-2.881z" />
                                            </svg>
                                        </div>
                                        <span class="text-[11px] text-secondary">Instagram</span>
                                    </a>
                                    <a href="#"
                                        @click.prevent="navigator.clipboard.writeText(window.location.href); $el.querySelector('span').textContent = 'Copied!'; setTimeout(() => $el.querySelector('span').textContent = 'Copy Link', 2000)"
                                        class="flex flex-col items-center gap-1.5 group">
                                        <div
                                            class="w-12 h-12 rounded-full bg-gray-100 flex items-center justify-center group-hover:bg-gray-200">
                                            <svg class="w-5 h-5 text-gray-600 stroke-current" fill="none"
                                                stroke-width="2" viewBox="0 0 24 24">
                                                <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71" />
                                                <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71" />
                                            </svg>
                                        </div>
                                        <span class="text-[11px] text-secondary">Copy Link</span>
                                    </a>
                                </div>
                                <div class="flex items-center gap-2 bg-gray-50 border border-border rounded px-3 py-2">
                                    <span class="text-[12px] text-secondary truncate flex-1"
                                        x-text="window.location.href"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Features -->
                    <div class="border-t border-[#D1D5DB] pt-4 flex flex-col gap-3">
                        <div class="flex items-center gap-3">
                            <div
                                class="w-8 h-8 bg-[#f7e5baa8] rounded-full flex items-center justify-center flex-shrink-0">
                                <svg class="w-4 h-4 text-brand" fill="none" stroke="currentColor" stroke-width="1.8"
                                    viewBox="0 0 24 24">
                                    <rect x="1" y="3" width="15" height="13" rx="1" />
                                    <path d="M16 8h4l3 5v3h-7V8z" />
                                    <circle cx="5.5" cy="18.5" r="2.5" />
                                    <circle cx="18.5" cy="18.5" r="2.5" />
                                </svg>
                            </div>
                            <div>
                                <p class="text-[13px] font-semibold text-primary">Free Shipping</p>
                                <p class="text-[12px] text-secondary">On orders over ₹500</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3">
                            <div
                                class="w-8 h-8 bg-[#f7e5baa8] rounded-full flex items-center justify-center flex-shrink-0">
                                <svg class="w-4 h-4 text-brand" fill="none" stroke="currentColor" stroke-width="1.8"
                                    viewBox="0 0 24 24">
                                    <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
                                    <path d="M3 3v5h5" />
                                </svg>
                            </div>
                            <div>
                                <p class="text-[13px] font-semibold text-primary">30-Day Returns</p>
                                <p class="text-[12px] text-secondary">Hassle-free return policy</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>{{-- grid end --}}
        </div>
    </section>

    <!-- ===================== TABS SECTION ===================== -->
    <section class="bg-[#f5f3ef] py-10">
        <div class="max-w-7xl mx-auto px-4 md:px-8">

            <div x-data="{ tab: 'description' }">
                <div class="flex gap-8 border-b border-gray-300 mb-6">
                    <button @click="tab='description'"
                        :class="tab === 'description' ? 'text-[#c4a47c] border-b-2 border-[#c4a47c]' : 'text-gray-500'"
                        class="pb-2 text-[14px] font-medium transition">Description</button>
                    <button @click="tab='specs'"
                        :class="tab === 'specs' ? 'text-[#c4a47c] border-b-2 border-[#c4a47c]' : 'text-gray-500'"
                        class="pb-2 text-[14px] font-medium transition">Specifications</button>
                    <button @click="tab='shipping'"
                        :class="tab === 'shipping' ? 'text-[#c4a47c] border-b-2 border-[#c4a47c]' : 'text-gray-500'"
                        class="pb-2 text-[14px] font-medium transition">Shipping Info</button>
                </div>

                <div class="bg-white p-6 md:p-5 rounded">

                    <!-- Description -->
                    <div x-cloak x-show="tab==='description'" x-transition>
                        <h3 class="text-[24px] font-[400] text-text mb-3">Product Description</h3>
                        <div class="text-[16px] text-text font-[400] leading-relaxed mb-4">
                            {!! nl2br(e($product->description)) !!}
                        </div>
                    </div>

                    <!-- Specs -->
                    <div x-cloak x-show="tab==='specs'" x-transition>
                        <div class="grid md:grid-cols-2 gap-8">
                            <div>
                                <h3 class="text-[24px] font-[400] text-text mb-6">Product Specifications</h3>
                                <div class="grid grid-cols-2 gap-x-6 gap-y-5">
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Fabric Type</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->productcategory->name }}
                                        </p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Composition</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->composition ?? 'N/A' }}
                                        </p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Weight</p>
                                        <p class="text-[16px] font-[400] text-text">
                                            {{ $product->weight ? $product->weight . ' GSM' : 'N/A' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Width</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->width ?? 'N/A' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Weave</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->weave ?? 'N/A' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Origin</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->origin ?? 'N/A' }}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="md:border-l md:pl-8">
                                <h3 class="text-[24px] font-[400] text-text mb-6">Care & Shipping</h3>
                                <div class="grid grid-cols-2 gap-x-6 gap-y-5">
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Care Instructions</p>
                                        <p class="text-[16px] font-[400] text-text">
                                            {{ $product->care_instructions ?? 'N/A' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">Origin</p>
                                        <p class="text-[16px] font-[400] text-text">{{ $product->origin ?? 'N/A' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">India Shipping</p>
                                        <p class="text-[16px] font-[400] text-text">
                                            {{ $product->india_shipping ?? '2-3 Business Days' }}</p>
                                    </div>
                                    <div>
                                        <p class="text-[12px] text-primary mb-1">International Shipping</p>
                                        <p class="text-[16px] font-[400] text-text">
                                            {{ $product->international_shipping ?? '5-7 Business Days' }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Shipping -->
                    <div x-cloak x-show="tab==='shipping'" x-transition>
                        <h3 class="text-[24px] font-[400] text-text mb-6">Shipping & Delivery</h3>
                        <div class="grid md:grid-cols-2 gap-x-8 gap-y-5">
                            <div>
                                <p class="text-[12px] text-primary mb-1">Standard Delivery</p>
                                <p class="text-[16px] font-[400] text-text">₹0 (Free on orders above ₹500)</p>
                            </div>
                            <div>
                                <p class="text-[12px] text-primary mb-1">International Shipping</p>
                                <p class="text-[16px] font-[400] text-text">
                                    {{ $product->international_shipping ?? 'Available to 20+ Countries' }}</p>
                            </div>
                            <div>
                                <p class="text-[12px] text-primary mb-1">Delivery Time</p>
                                <p class="text-[16px] font-[400] text-text">
                                    {{ $product->india_shipping ?? 'Delivery within 5-7 business days' }}</p>
                            </div>
                            <div>
                                <p class="text-[12px] text-primary mb-1">Express Delivery</p>
                                <p class="text-[16px] font-[400] text-text">₹100</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- ===================== REVIEWS ===================== -->
            <div x-data="{ writeReview: false, userRating: 0, hoverRating: 0 }" class="mt-6 border-t border-border">

                @if (session('review_success'))
                    <div class="mt-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">
                        ✓ {{ session('review_success') }}
                    </div>
                @endif

                <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-6 mt-6 px-1">
                    <div>
                        <h3 class="text-[26px] md:text-[30px] font-[400] text-text italic">Customer Reviews</h3>
                        <p class="text-[13px] md:text-[14px] text-text mt-0.5">
                            Based on {{ $product->review_count }} verified purchases
                        </p>
                    </div>
                    @auth
                        <button @click="writeReview = true"
                            class="w-full sm:w-auto border border-border text-primary text-[13px] font-medium px-5 py-2.5 rounded hover:border-brand hover:text-brand transition-colors text-center">
                            Write a Review
                        </button>
                    @else
                        <a href="{{ route('login') }}"
                            class="w-full sm:w-auto border border-border text-primary text-[13px] font-medium px-5 py-2.5 rounded hover:border-brand hover:text-brand transition-colors text-center">
                            Login to Review
                        </a>
                    @endauth
                </div>

                <!-- Rating Summary -->
                <div class="flex flex-col md:flex-row gap-6 md:gap-8 bg-surface rounded-xl p-5 md:p-6 mb-6">
                    <div
                        class="flex flex-col items-center justify-center w-full md:w-[130px] shrink-0 border-b md:border-b-0 md:border-r border-border pb-6 md:pb-0 md:pr-8">
                        <p class="text-[42px] md:text-[48px] font-bold text-primary leading-none mb-2">
                            {{ $product->rating }}</p>
                        <div class="flex gap-0.5 mb-1">
                            @for ($i = 1; $i <= 5; $i++)
                                <iconify-icon icon="lucide:star"
                                    class="{{ $i <= floor($product->rating) ? 'text-[#FFCC33]' : 'text-secondary' }}"
                                    width="18"></iconify-icon>
                            @endfor
                        </div>
                        <p class="text-[12px] text-secondary">Out of 5 stars</p>
                    </div>

                    <div class="flex-1 flex flex-col justify-center gap-3 md:gap-2.5 w-full">
                        @foreach ($product->rating_breakdown as $star => $data)
                            <div class="flex items-center gap-3">
                                <span class="text-[13px] text-secondary w-3 shrink-0">{{ $star }}</span>
                                <iconify-icon icon="lucide:star" class="text-[#FFCC33] shrink-0"
                                    width="12"></iconify-icon>
                                <div class="flex-1 bg-gray-200 rounded-full h-2 overflow-hidden">
                                    <div class="bg-[#FFCC33] h-full rounded-full transition-all duration-500"
                                        style="width:{{ $data['percent'] }}%"></div>
                                </div>
                                <span
                                    class="text-[13px] text-secondary w-5 shrink-0 text-right">{{ $data['count'] }}</span>
                            </div>
                        @endforeach
                    </div>
                </div>

                <!-- Review Cards -->
                <div class="space-y-4">
                    @forelse($product->reviews as $review)
                        <div class="bg-white border border-border rounded-xl p-4 md:p-5 transition-all hover:shadow-sm">
                            <div class="flex flex-col sm:flex-row items-start justify-between gap-3 mb-4">
                                <div class="flex flex-col gap-1">
                                    <div class="flex flex-wrap items-center gap-2">
                                        <p class="text-[15px] md:text-[16px] font-bold text-text">
                                            {{ $review->reviewer_name }}</p>
                                        @if ($review->verified_purchase)
                                            <span
                                                class="flex items-center gap-1 bg-green-50 text-green-600 text-[10px] font-medium px-2 py-0.5 rounded-full border border-green-100">
                                                <iconify-icon icon="lucide:check" width="10"></iconify-icon>
                                                Verified Purchase
                                            </span>
                                        @endif
                                    </div>
                                    <p class="text-[12px] text-secondary">{{ $review->time_ago }}</p>
                                </div>
                                <div class="flex gap-0.5 shrink-0">
                                    @for ($i = 1; $i <= 5; $i++)
                                        <iconify-icon icon="lucide:star"
                                            class="{{ $i <= $review->rating ? 'text-[#FFCC33]' : 'text-secondary' }}"
                                            width="14"></iconify-icon>
                                    @endfor
                                </div>
                            </div>
                            <h4 class="text-[15px] md:text-[16px] font-semibold text-text mb-1.5">{{ $review->title }}
                            </h4>
                            <p class="text-[14px] md:text-[16px] text-secondary font-[400] leading-relaxed mb-4">
                                {{ $review->body }}</p>
                            <div class="flex items-center justify-between pt-3 border-t border-gray-50">
                                <button
                                    class="flex items-center gap-1.5 text-[12px] text-secondary hover:text-brand transition-colors group">
                                    <iconify-icon icon="lucide:thumbs-up"
                                        class="group-hover:scale-110 transition-transform" width="14"></iconify-icon>
                                    <span class="font-medium">Helpful ({{ $review->helpful_count }})</span>
                                </button>
                                <button class="text-gray-300 hover:text-red-400 transition-colors">
                                    <iconify-icon icon="lucide:flag" width="14"></iconify-icon>
                                </button>
                            </div>
                        </div>
                    @empty
                        <div class="text-center py-10 text-secondary">
                            <iconify-icon icon="lucide:message-square" width="40"
                                class="mb-3 opacity-30"></iconify-icon>
                            <p class="text-[15px]">No reviews yet. Be the first to review!</p>
                        </div>
                    @endforelse
                </div>

                <!-- Write Review Modal -->
                @auth
                    <div x-cloak x-show="writeReview" class="fixed inset-0 z-50 flex items-center justify-center p-4"
                        x-transition:enter="transition-opacity duration-300" x-transition:enter-start="opacity-0"
                        x-transition:enter-end="opacity-100" x-transition:leave="transition-opacity duration-300"
                        x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0">

                        <div class="absolute inset-0 bg-black/50" @click="writeReview = false"></div>

                        <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-lg z-10 overflow-y-auto max-h-[90vh]"
                            x-transition:enter="transition-all duration-300" x-transition:enter-start="opacity-0 scale-95"
                            x-transition:enter-end="opacity-100 scale-100">

                            <div class="flex items-start justify-between p-6 pb-4">
                                <div>
                                    <h3 class="text-[22px] font-bold text-primary">Write a Review</h3>
                                    <p class="text-[13px] text-secondary mt-0.5">Share your thoughts about this product</p>
                                </div>
                                <button @click="writeReview = false" class="text-secondary hover:text-primary mt-1">
                                    <iconify-icon icon="lucide:x" width="20"></iconify-icon>
                                </button>
                            </div>

                            <div class="px-6 pb-6">
                                <form method="POST" action="{{ route('review.submit', $product->slug) }}">
                                    @csrf

                                    <div class="mb-5">
                                        <p class="text-[14px] font-medium text-primary mb-2">Overall Rating <span
                                                class="text-red-400">*</span></p>
                                        <div class="flex gap-2">
                                            <template x-for="star in [1,2,3,4,5]" :key="star">
                                                <button type="button" @click="userRating = star"
                                                    @mouseenter="hoverRating = star" @mouseleave="hoverRating = 0">
                                                    <iconify-icon icon="lucide:star"
                                                        :class="(hoverRating || userRating) >= star ? 'text-brand' :
                                                            'text-gray-300'"
                                                        width="32"></iconify-icon>
                                                </button>
                                            </template>
                                        </div>
                                        <input type="hidden" name="rating" :value="userRating" />
                                    </div>

                                    <div class="mb-4">
                                        <label class="text-[14px] font-medium text-primary mb-1.5 block">Review Title <span
                                                class="text-red-400">*</span></label>
                                        <input type="text" name="title" placeholder="Summarize your experience"
                                            class="w-full bg-surface border border-border rounded px-3 py-2.5 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors" />
                                    </div>

                                    <div class="mb-4" x-data="{ count: 0 }">
                                        <label class="text-[14px] font-medium text-primary mb-1.5 block">Your Review <span
                                                class="text-red-400">*</span></label>
                                        <textarea rows="5" name="body" placeholder="Share details about your experience..." maxlength="1000"
                                            @input="count = $el.value.length"
                                            class="w-full bg-surface border border-border rounded px-3 py-2.5 text-[14px] text-primary placeholder:text-placeholder outline-none focus:border-brand transition-colors resize-none"></textarea>
                                        <div class="flex items-center justify-between mt-1">
                                            <span class="text-[12px] text-secondary">Minimum 100 Characters</span>
                                            <span class="text-[12px] text-secondary" x-text="count + '/1000'"></span>
                                        </div>
                                    </div>

                                    <div class="flex gap-3">
                                        <button type="button" @click="writeReview = false"
                                            class="flex-1 border border-border text-primary text-[14px] font-medium py-2.5 rounded hover:border-brand hover:text-brand transition-colors">
                                            Cancel
                                        </button>
                                        <button type="submit"
                                            class="flex-1 bg-brand text-white text-[14px] font-medium py-2.5 rounded hover:opacity-90 transition-opacity">
                                            Submit Review
                                        </button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                @endauth

            </div>
        </div>
    </section>

    <!-- ===================== RECOMMENDED PRODUCTS ===================== -->
    <section class="bg-[#F5F0EB]">
        <div class="max-w-7xl mx-auto px-4 md:px-8">

            <div class="flex items-center justify-between mb-6 px-1 md:px-0">
                <h2 class="text-[22px] md:text-[30px] font-[400] text-text italic leading-tight">
                    Recommended products
                </h2>
                <a href="{{ route('products') }}"
                    class="text-[13px] text-primary hover:text-brand transition-colors flex items-center gap-1 shrink-0 whitespace-nowrap ml-4">
                    View All
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>
            </div>

            <div class="relative">
                <button
                    class="rec-prev absolute -left-4 top-1/2 -translate-y-1/2 z-10 w-8 h-8 bg-white rounded-full shadow-md flex items-center justify-center hover:bg-brand hover:text-white transition-colors text-primary">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m15 18-6-6 6-6" />
                    </svg>
                </button>
                <button
                    class="rec-next absolute -right-4 top-1/2 -translate-y-1/2 z-10 w-8 h-8 bg-white rounded-full shadow-md flex items-center justify-center hover:bg-brand hover:text-white transition-colors text-primary">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </button>

                <div class="swiper rec-swiper overflow-hidden">
                    <div class="swiper-wrapper">
                        @forelse($recommended as $rec)
                            <div class="swiper-slide">
                                <a href="{{ route('productdetail', $rec->slug) }}"
                                    class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group">
                                    <div class="relative overflow-hidden">
                                        <img src="{{ $rec->primary_image_url }}" alt="{{ $rec->name }}"
                                            class="w-full h-[180px] md:h-[260px] object-cover group-hover:scale-105 transition-transform duration-300" />
                                        <button
                                            class="absolute top-3 left-3 bg-brand/90 text-primary p-2 rounded-md hover:bg-brand transition-colors">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2"
                                                viewBox="0 0 24 24">
                                                <circle cx="9" cy="21" r="1" />
                                                <circle cx="20" cy="21" r="1" />
                                                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
                                            </svg>
                                        </button>
                                    </div>
                                    <div class="p-3">
                                        <p class="text-[12px] font-semibold tracking-widest text-brand uppercase mb-1">
                                            {{ $rec->category }}</p>
                                        <h3 class="text-[18px] font-semibold text-primary mb-1">{{ $rec->name }}</h3>
                                        <p class="text-[16px] text-secondary leading-relaxed mb-3">
                                            {{ $rec->short_description }}</p>
                                        <div class="flex items-center justify-between">
                                            <span
                                                class="text-[16px] font-bold text-primary">{{ $rec->formatted_price }}</span>
                                            <span class="text-[12px] text-secondary">MOQ: {{ $rec->moq }}
                                                meters</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @empty
                            <div class="swiper-slide">
                                <p class="text-secondary text-[14px]">No recommended products found.</p>
                            </div>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Zoom Result Box -->
    <div id="globalZoomResult"
        style="display:none;position:fixed;width:320px;height:320px;border:2px solid #C6A75E;border-radius:12px;overflow:hidden;z-index:99999;box-shadow:0 12px 40px rgba(0,0,0,0.18);pointer-events:none;background:#fff;">
        <img id="globalZoomImg" style="position:absolute;max-width:none;top:0;left:0;" />
    </div>

    <!-- BULK INQUIRY MODAL -->
    <div id="bulkModal" class="modal-backdrop fixed inset-0 z-[999] flex items-center justify-center p-4 bg-black/70"
        style="display:none;">
        <div class="relative bg-white rounded-2xl w-full max-w-lg max-h-[90vh] overflow-y-auto p-7 shadow-2xl">
            <button onclick="closeModal('bulkModal')" class="absolute top-4 right-4 text-secondary hover:text-primary">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path d="M18 6 6 18M6 6l12 12" />
                </svg>
            </button>
            <h2 class="text-[22px] font-bold text-primary mb-1">Inquiry Form</h2>
            <p class="text-[13px] text-secondary mb-6">Get the best wholesale pricing for
                <strong>{{ $product->name }}</strong>
            </p>
            <div class="flex flex-col gap-4">
                <form action="{{ route('inquiry.submit') }}" method="POST">
                    @csrf

                    <input type="hidden" name="product_id" value="{{ $product->id }}" />

                    <div>
                        <label class="text-[13px] font-medium text-primary mb-1.5 block">Full Name</label>
                        <input type="text" name="name" placeholder="Enter your name"
                            value="{{ Auth::user()?->first_name . ' ' . Auth::user()?->last_name }}"
                            class="w-full bg-[#F5F5F5] outline-none rounded-lg px-4 py-3 text-[13px] placeholder:text-placeholder" />
                        @error('name')
                            <p class="text-red-500 text-[11px] mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="text-[13px] font-medium text-primary mb-1.5 block">Phone Number</label>
                        <input type="tel" name="phone" placeholder="+91 ••••••••••"
                            value="{{ Auth::user()?->phone }}"
                            class="w-full bg-[#F5F5F5] outline-none rounded-lg px-4 py-3 text-[13px] placeholder:text-placeholder" />
                        @error('phone')
                            <p class="text-red-500 text-[11px] mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="text-[13px] font-medium text-primary mb-1.5 block">Email Address</label>
                        <input type="email" name="email" placeholder="example@gmail.com"
                            value="{{ Auth::user()?->email }}"
                            class="w-full bg-[#F5F5F5] outline-none rounded-lg px-4 py-3 text-[13px] placeholder:text-placeholder" />
                        @error('email')
                            <p class="text-red-500 text-[11px] mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="text-[13px] font-medium text-primary mb-1.5 block">Quantity Required <span
                                class="text-brand">*</span></label>
                        <input type="text" name="quantity" placeholder="500 meter or 100 pieces"
                            class="w-full bg-[#F5F5F5] outline-none rounded-lg px-4 py-3 text-[13px] placeholder:text-placeholder" />
                        @error('quantity')
                            <p class="text-red-500 text-[11px] mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="text-[13px] font-medium text-primary mb-1.5 block">Message <span
                                class="text-brand">*</span></label>
                        <textarea rows="4" name="message" placeholder="I'm interested in bulk order for {{ $product->name }}"
                            class="w-full bg-[#F5F5F5] outline-none rounded-lg px-4 py-3 text-[13px] placeholder:text-placeholder resize-none"></textarea>
                    </div>

                    <button type="submit"
                        class="w-full bg-brand text-white py-3.5 rounded-lg text-[14px] font-semibold hover:opacity-90 transition-opacity">
                        Submit Inquiry
                    </button>

                </form>
            </div>
        </div>
    </div>

    <script>
        function productGallery() {
            return {
                imagesByColor: @json(collect($imagesByColor)->map(function ($imgs) {
                        return collect($imgs)->map(fn($img) => ['url' => $img->url, 'color' => $img->color])->values();
                    })),
                allImages: @json($allImages),
                activeColor: '{{ $product->colors[0] ?? 'default' }}',
                activeImage: '',
                activeImages: [],
                activeIndex: 0,

                init() {
                    this.selectColor(this.activeColor);
                },

                selectColor(color) {
                    this.activeColor = color;
                    const filtered = this.allImages.filter(img => img.color === color);
                    this.activeImages = filtered.length > 0 ? filtered : this.allImages;
                    this.activeImage = this.activeImages[0]?.url || '';
                    this.activeIndex = 0;
                },

                showZoom() {
                    document.getElementById('globalZoomResult').style.display = 'block';
                },

                hideZoom() {
                    document.getElementById('globalZoomResult').style.display = 'none';
                    document.getElementById('zoomLens').style.display = 'none';
                },

                handleZoom(e) {
                    const img = document.getElementById('mainImage');
                    const lens = document.getElementById('zoomLens');
                    const result = document.getElementById('globalZoomResult');
                    const zoomImg = document.getElementById('globalZoomImg');

                    if (!img || !lens || !result) return;

                    const rect = img.getBoundingClientRect();
                    const zoomFactor = 3;
                    const lensW = lens.offsetWidth || 120;
                    const lensH = lens.offsetHeight || 120;

                    let x = e.clientX - rect.left - lensW / 2;
                    let y = e.clientY - rect.top - lensH / 2;

                    x = Math.max(0, Math.min(x, rect.width - lensW));
                    y = Math.max(0, Math.min(y, rect.height - lensH));

                    lens.style.display = 'block';
                    lens.style.left = x + 'px';
                    lens.style.top = y + 'px';

                    result.style.left = (rect.right + 15) + 'px';
                    result.style.top = rect.top + 'px';

                    zoomImg.src = this.activeImage;
                    zoomImg.style.width = (rect.width * zoomFactor) + 'px';
                    zoomImg.style.height = (rect.height * zoomFactor) + 'px';
                    zoomImg.style.left = -(x * zoomFactor) + 'px';
                    zoomImg.style.top = -(y * zoomFactor) + 'px';
                }
            }
        }

        function chQty(change, moq) {
            const el = document.getElementById('qty');
            let val = parseInt(el.textContent) + change;
            if (val < moq) val = moq;
            el.textContent = val;
        }

        function openModal(id) {
            document.getElementById(id).style.display = 'flex';
        }

        function closeModal(id) {
            document.getElementById(id).style.display = 'none';
        }
    </script>

@endsection
