@extends('dashboard.layout.main')
@section('content')
    <section class="bg-gradient-to-r from-[#404040] to-[#1F2937] text-white border-b border-white/20 py-8 md:py-12">

        <div class="max-w-7xl mx-auto px-6 md:px-8">

            <nav class="flex justify-center md:justify-start mb-6" aria-label="Breadcrumb">
                <ol class="flex items-center space-x-2 text-xs md:text-sm text-gray-300">
                    <li>
                        <a href="{{ url('/') }}" class="hover:text-white transition-colors">Home</a>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-gray-500">/</span>
                        <span class="text-white font-medium">All Products</span>
                    </li>
                </ol>
            </nav>

            <div class="text-center">
                <h1 class="text-[28px] md:text-[40px] lg:text-[48px] font-[400] italic mb-3 leading-tight">
                    Our Collections
                </h1>

                <p class="text-[14px] md:text-base text-gray-300 max-w-xl mx-auto leading-relaxed">
                    Browse our complete range of premium textiles and handcrafted fabrics
                </p>
            </div>

        </div>

    </section>


    <section class="bg-light">
        <div class="max-w-8xl mx-auto px-4 md:px-8">
            <div class="flex flex-col md:flex-row gap-8" x-data="{
                activeCategory: 'All',
                activePrice: '',
                sortOpen: false
            }">

                <!-- Left Sidebar — Filters -->
                <div x-cloak x-data="{ mobileFilters: false }" class="shrink-0">
                    <div class="md:hidden flex items-center justify-between mb-4">
                        <button @click="mobileFilters = true"
                            class="flex items-center gap-2 bg-white border border-border px-4 py-2 rounded-sm text-sm font-medium text-primary active:scale-95 transition-transform">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path d="M4 6h16M4 12h10M4 18h7" stroke-linecap="round" />
                            </svg>
                            Filter Categories
                        </button>
                        <span class="text-xs text-secondary" x-text="'Category: ' + activeCategory"></span>
                    </div>

                    <div :class="mobileFilters ? 'fixed inset-0 z-[100] flex' : 'hidden md:block w-[200px]'"
                        class="bg-transparent">
                        <div x-show="mobileFilters" x-transition:enter="transition opacity-0 duration-300"
                            x-transition:enter-end="opacity-100" x-transition:leave="transition opacity-100 duration-300"
                            x-transition:leave-end="opacity-0" @click="mobileFilters = false"
                            class="fixed inset-0 bg-black/60 md:hidden"></div>

                        <div class="relative w-[280px] md:w-full h-full md:h-auto bg-white p-5 md:p-2 flex flex-col shadow-2xl md:shadow-none transition-transform duration-300 ease-in-out"
                            :class="mobileFilters ? 'translate-x-0' : '-translate-x-full md:translate-x-0'">
                            <div class="flex items-center justify-between mb-8 md:hidden border-b pb-4">
                                <h3 class="text-lg font-bold text-primary">Filters</h3>
                                <button @click="mobileFilters = false" class="p-2 text-secondary">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2"
                                        viewBox="0 0 24 24">
                                        <path d="M18 6L6 18M6 6l12 12" />
                                    </svg>
                                </button>
                            </div>

                            <div class="mb-8" data-aos="fade-right">
                                <h4 class="text-[14px] md:text-[16px] font-bold text-primary mb-4 uppercase tracking-wider">
                                    Categories</h4>
                                <ul class="space-y-1">

                                    {{-- All Category --}}
                                    <li>
                                        <a href="{{ route('products') }}"
                                            class="w-full block text-left px-3 py-2.5 text-[15px] rounded-sm
                                              {{ request('category') == '' ? 'bg-brand text-white' : 'text-primary hover:text-brand hover:bg-gray-50' }}">
                                            All
                                        </a>
                                    </li>

                                    {{-- Dynamic Categories --}}
                                    @foreach ($categories as $cat)
                                        <li>
                                            <a href="{{ route('products', ['category' => $cat->slug]) }}"
                                                class="w-full block text-left px-3 py-2.5 text-[15px] rounded-sm
                                                {{ request('category') == $cat->slug ? 'bg-brand text-white' : 'text-primary hover:text-brand hover:bg-gray-50' }}">
                                                {{ $cat->name }}
                                            </a>
                                        </li>
                                    @endforeach

                                </ul>
                            </div>

                            <div class="border-t border-gray-100 mb-8 md:mb-6"></div>

                            <div data-aos="fade-right" data-aos-delay="100">
                                <h4 class="text-[14px] md:text-[16px] font-bold text-primary mb-4 uppercase tracking-wider">
                                    Price Range</h4>
                                <ul class="space-y-1">

                                    <li>
                                        <a href="{{ request()->fullUrlWithQuery(['price' => '50-100']) }}"
                                            class="w-full block text-left px-3 py-2 rounded-sm
                                                {{ request('price') == '50-100' ? 'text-brand font-semibold bg-brand/5' : 'text-primary hover:text-brand' }}">
                                            ₹50 - ₹100
                                        </a>
                                    </li>

                                    <li>
                                        <a href="{{ request()->fullUrlWithQuery(['price' => '100-150']) }}"
                                            class="w-full block text-left px-3 py-2 rounded-sm
                                                  {{ request('price') == '100-150' ? 'text-brand font-semibold bg-brand/5' : 'text-primary hover:text-brand' }}">
                                            ₹100 - ₹150
                                        </a>
                                    </li>

                                    <li>
                                        <a href="{{ request()->fullUrlWithQuery(['price' => '150+']) }}"
                                            class="w-full block text-left px-3 py-2 rounded-sm
                                                {{ request('price') == '150+' ? 'text-brand font-semibold bg-brand/5' : 'text-primary hover:text-brand' }}">
                                            ₹150+
                                        </a>
                                    </li>

                                </ul>
                            </div>

                            <div class="mt-auto pt-6 md:hidden">
                                <button @click="mobileFilters = false"
                                    class="w-full bg-brand text-white py-4 rounded-sm font-bold uppercase tracking-widest text-[13px] shadow-lg">
                                    Show Results
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right — Products -->
                <div class="flex-1">

                    <!-- Top Bar: Count + Sort -->
                    <div class="flex items-center justify-between mb-6">
                        <p class="text-[15px] text-secondary">
                            Showing <span class="font-semibold text-primary">{{ $products->total() }} products</span>
                        </p>

                        {{-- Sort Dropdown --}}
                        <div class="relative" x-data="{ sortOpen: false, sort: 'Newest' }">
                            <button @click="sortOpen = !sortOpen"
                                class="flex items-center gap-2 bg-primary text-white text-[13px] px-4 py-2 hover:bg-primary/90">
                                Sort By: <span x-text="sort"></span>
                                <svg class="w-3 h-3 transition-transform" :class="sortOpen ? 'rotate-180' : ''"
                                    fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path d="m6 9 6 6 6-6" />
                                </svg>
                            </button>
                            <div x-cloak x-show="sortOpen" @click.outside="sortOpen = false" x-transition
                                class="absolute right-0 top-full mt-1 bg-white border border-border w-44 z-[999] shadow-lg">
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'newest']) }}"
                                    @click="sort='Newest'; sortOpen=false"
                                    class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50">Newest</a>
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'price_asc']) }}"
                                    @click="sort='Price: Low to High'; sortOpen=false"
                                    class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50">Price:
                                    Low to High</a>
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'price_desc']) }}"
                                    @click="sort='Price: High to Low'; sortOpen=false"
                                    class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50">Price:
                                    High to Low</a>
                                <a href="{{ request()->fullUrlWithQuery(['sort' => 'popular']) }}"
                                    @click="sort='Popular'; sortOpen=false"
                                    class="block px-4 py-2.5 text-[14px] text-primary hover:text-brand hover:bg-gray-50">Popular</a>
                            </div>
                        </div>
                    </div>

                    <!-- Products Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        @forelse($products as $product)
                            <a href="{{ route('productdetail', $product->slug) }}"
                                class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group">
                                <div class="relative overflow-hidden">
                                    <img src="{{ $product->primary_image_url }}" alt="{{ $product->name }}"
                                        class="w-full h-[180px] md:h-[260px] object-cover group-hover:scale-105 transition-transform duration-300" />
                                    <button
                                        @auth
                                          onclick="event.preventDefault(); event.stopPropagation(); addToCart({{ $product->id }})"
                                            @else
                                          onclick="event.preventDefault(); window.location.href='{{ route('login') }}'" @endauth
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
                                        {{ $product->productcategory->name }}
                                    </p>
                                    <h3 class="text-[18px] font-semibold text-primary mb-1">{{ $product->name }}</h3>
                                    <p class="text-[16px] text-secondary leading-relaxed mb-3">
                                        {{ $product->short_description }}</p>
                                    <div class="flex items-center justify-between">
                                        <span
                                            class="text-[16px] font-bold text-primary">{{ $product->formatted_price }}</span>
                                        <span class="text-[12px] text-secondary">MOQ: {{ $product->moq }} meters</span>
                                    </div>
                                </div>
                            </a>
                        @empty
                            <div class="col-span-3 text-center py-20 text-secondary">
                                <p class="text-[18px]">No products found.</p>
                            </div>
                        @endforelse
                    </div>
                </div>
                {{-- Pagination --}}
                <div class="mt-8">
                    {{ $products->links() }}
                </div>

            </div>
        </div>
    </section>
@endsection
