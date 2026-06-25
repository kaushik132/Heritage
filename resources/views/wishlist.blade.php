@extends('dashboard.layout.main')
@section('content')

    <section class="bg-gradient-to-r from-[#404040] to-[#1F2937] text-white border-b border-white/20">
        <div class="max-w-7xl mx-auto px-6 md:px-8 py-8 md:py-12">
            <nav class="flex justify-center md:justify-start mb-6">
                <ol class="flex items-center space-x-2 text-xs md:text-sm text-gray-300">
                    <li><a href="{{ route('home') }}" class="hover:text-white transition-colors">Home</a></li>
                    <li class="flex items-center space-x-2">
                        <span class="text-gray-500">/</span>
                        <span class="text-white font-medium">Wishlist</span>
                    </li>
                </ol>
            </nav>
            <div class="text-center">
                <h1 class="text-[28px] md:text-4xl font-[400] italic mb-2 text-white leading-tight">My Wishlist</h1>
                <p class="text-[13px] md:text-base text-gray-300 max-w-md mx-auto leading-relaxed">
                    Your personal collection of premium fabrics and handcrafted designs.
                </p>
            </div>
        </div>
    </section>

    <section class="bg-light">
        <div class="max-w-8xl mx-auto px-4 md:px-8">

            @if (session('success'))
                <div class="mb-4 p-3 bg-green-50 border border-green-200 text-green-700 text-[13px]">
                    ✓ {{ session('success') }}
                </div>
            @endif

            @if ($wishlists->isEmpty())
                {{-- Empty State --}}
                <div class="text-center py-20">
                    <iconify-icon icon="lucide:heart" width="60" class="text-gray-200 mb-4"></iconify-icon>
                    <h2 class="text-[22px] font-semibold text-primary mb-2">Your wishlist is empty</h2>
                    <p class="text-secondary text-[14px] mb-6">Save your favourite products here and shop later.</p>
                    <a href="{{ route('products') }}"
                        class="inline-block bg-brand text-white text-[13px] font-semibold px-8 py-3 hover:opacity-90 transition-opacity">
                        Browse Products
                    </a>
                </div>
            @else
                {{-- Header --}}
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-[20px] font-semibold text-primary">
                        My Wishlist ({{ $wishlists->count() }} Items)
                    </h2>
                    <form method="POST" action="{{ route('wishlist.clear') }}">
                        @csrf
                        @method('DELETE')
                        <button type="submit" onclick="return confirm('Clear all wishlist items?')"
                            class="text-[13px] text-brand hover:underline cursor-pointer">
                            Clear Wishlist
                        </button>
                    </form>
                </div>

                {{-- Grid --}}
                <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
                    @foreach ($wishlists as $item)
                        @php $product = $item->product; @endphp
                        @if ($product)
                            <div class="wishlist-card bg-white overflow-hidden border border-[#D6D6D6] relative group">

                                {{-- Remove Button --}}
                                <form method="POST" action="{{ route('wishlist.remove', $product->id) }}"
                                    class="absolute top-2 left-2 z-10">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit"
                                        class="w-7 h-7 bg-white border border-[#D6D6D6] flex items-center justify-center text-primary hover:bg-red-50 hover:border-red-400 hover:text-red-500 transition-all cursor-pointer shadow-sm">
                                        <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2.5"
                                            viewBox="0 0 24 24">
                                            <path d="M18 6 6 18M6 6l12 12" />
                                        </svg>
                                    </button>
                                </form>

                                {{-- Image --}}
                                <a href="{{ route('productdetail', $product->slug) }}">
                                    <div class="overflow-hidden">
                                        <img src="{{ $product->primary_image_url }}" alt="{{ $product->name }}"
                                            class="w-full h-[180px] object-cover group-hover:scale-105 transition-transform duration-300" />
                                    </div>
                                </a>

                                {{-- Details --}}
                                <div class="p-3">
                                    <p class="text-[10px] tracking-[2px] uppercase text-brand font-semibold mb-1">
                                        {{ $product->productcategory->name }}
                                    </p>
                                    <a href="{{ route('productdetail', $product->slug) }}">
                                        <h3
                                            class="text-[14px] font-semibold text-primary mb-1 hover:text-brand transition-colors">
                                            {{ $product->name }}
                                        </h3>
                                    </a>
                                    <p class="text-[12px] text-secondary leading-relaxed mb-3">
                                        {{ Str::limit($product->short_description, 70) }}
                                    </p>
                                    <div class="flex items-center justify-between">
                                        <span class="text-[14px] font-bold text-primary">
                                            {{ $product->formatted_price }}
                                        </span>
                                        <button
                                            @auth
                                            onclick="event.preventDefault(); event.stopPropagation(); addToCart({{ $product->id }})"
                                              @else
                                            onclick="event.preventDefault(); window.location.href='{{ route('login') }}'" @endauth
                                            class="w-8 h-8 bg-brand text-white flex items-center justify-center hover:opacity-90 transition-opacity cursor-pointer">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2"
                                                viewBox="0 0 24 24">
                                                <circle cx="9" cy="21" r="1" />
                                                <circle cx="20" cy="21" r="1" />
                                                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>

                {{-- Continue Shopping --}}
                <div class="text-center mt-10 pb-4">
                    <a href="{{ route('products') }}"
                        class="inline-block border border-brand text-brand text-[13px] font-semibold px-8 py-3 hover:bg-brand hover:text-white transition-all">
                        Continue Shopping
                    </a>
                </div>
            @endif

        </div>
    </section>

    <script>
        // Agar wishlist toggle AJAX se hai
        function toggleWishlist(productId) {
            fetch(`/wishlist/toggle/${productId}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                    },
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 'success') {
                        updateWishlistCount(data.count);
                        showToast(data.added ? 'Added to wishlist!' : 'Removed from wishlist!', 'success');
                    }
                });
        }
    </script>

@endsection
