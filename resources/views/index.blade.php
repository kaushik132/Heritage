@extends('dashboard.layout.main')
@section('content')
    <!-- ===================== HERO SLIDER ===================== -->
    <section class="relative py-0!">
        <div class="swiper hero-swiper">
            <div class="swiper-wrapper">

                <!-- Slide 1 -->
                @foreach ($homebanner as $banner)
                <div class="swiper-slide">
                    <div class="relative h-[420px] md:h-[620px] w-full overflow-hidden">
                        <img src="{{url('uploads/'.$banner->image)}}" alt="{{ $banner->alt }}"
                            class="w-full h-full object-cover" />
                        <div class="absolute inset-0 bg-black/45"></div>
                        <div class="absolute inset-0 flex flex-col justify-center px-6 md:px-20 w-full">

                            <h1
                                class="text-white text-[28px] sm:text-[36px] md:text-[60px] italic mb-4 font-[400] leading-tight serif">
                               {{ $banner->title }}
                            </h1>

                            <p class="text-white/80 text-[16px] md:text-[22px] font-[400] mb-8 max-w-2xl leading-relaxed">
                                {{ $banner->short_description }}
                            </p>

                            <div class="flex flex-wrap gap-3">
                                <a href="{{$banner->explore_link}}" target="_blank"
                                    class="inline-block border border-brand text-white text-[13px] md:text-sm px-6 py-3 rounded hover:bg-brand hover:text-primary transition-all text-center">
                                    Explore Our Craft
                                </a>
                                <a href="{{ $banner->start_custom_link }}" target="_blank"
                                    class="inline-block bg-white/10 text-white text-[13px] md:text-sm px-6 py-3 rounded hover:bg-white/20 transition-all backdrop-blur-sm text-center">
                                    Start Custom Design
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach



            </div>

            <!-- Pagination dots -->
            <div class="swiper-pagination" style="position: absolute; width: fit-content; right: 20px; bottom: 20px;"></div>
    </section>

    <!-- ===================== CATEGORY SECTION ===================== -->
    <section class="lg:pt-0! pb-2">

        <div class="max-w-8xl mx-auto px-4 md:px-8 mt-0 md:-mt-22 relative z-[1]">
            <div class="rounded-2xl shadow-xl overflow-hidden" x-data="{ activeTab: 'retailer' }">

                <!-- Tabs -->
                <div class="flex w-full md:w-fit lg:w-[45%]">

                    <button @click="activeTab = 'retailer'"
                        :class="activeTab === 'retailer'
                            ?
                            'bg-brand text-white' :
                            'text-[#787878] hover:text-[#000] bg-white'"
                        class="flex-1 px-4 md:px-7 py-3 text-[14px] md:text-[20px] font-[400] transition-all rounded-tl-2xl border-b-2 md:border-b-0"
                        :class="activeTab === 'retailer' ? 'border-brand' : 'border-transparent'">

                        Retail Categories
                    </button>

                    <button @click="activeTab = 'wholeseller'"
                        :class="activeTab === 'wholeseller'
                            ?
                            'bg-brand text-white' :
                            'text-[#787878] hover:text-primary bg-white'"
                        class="flex-1 px-4 md:px-7 py-3 text-[14px] md:text-[20px] font-[400] transition-all rounded-tr-2xl md:rounded-tr-[60px] border-b-2 md:border-b-0"
                        :class="activeTab === 'wholeseller' ? 'border-brand' : 'border-transparent'">

                        Wholesale/Bulk
                    </button>

                </div>

                <!-- Tab Content -->
                <div class="p-5 bg-white rounded-tr-xl">

                    <!-- Retailer -->
                    <div x-cloak x-show="activeTab === 'retailer'" x-transition>

                        <div class="swiper retail-swiper">
                            <div class="swiper-wrapper">

                                @foreach ($procathome->where('type', 'retailer') as $category)
                                    <div class="swiper-slide">
                                        <div class="relative overflow-hidden cursor-pointer group rounded-xl">

                                            <img src="{{ asset('uploads/' . $category->image) }}"
                                                alt="{{ $category->name }}"
                                                class="w-full h-[150px] md:h-[200px] object-cover group-hover:scale-105 transition-transform duration-300 rounded-xl" />

                                            <div class="text-primary text-[18px] font-[400] text-center py-2">
                                                {{ $category->name }}
                                            </div>

                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                    </div>

                    <!-- Wholeseller -->
                    <div x-cloak x-show="activeTab === 'wholeseller'" x-transition>

                        <div class="swiper wholesale-swiper">
                            <div class="swiper-wrapper">

                                @foreach ($procathome->where('type', 'wholeseller') as $category)
                                    <div class="swiper-slide">
                                        <div class="relative overflow-hidden cursor-pointer group rounded-xl">

                                            <img src="{{ asset('uploads/' . $category->image) }}"
                                                alt="{{ $category->name }}"
                                                class="w-full h-[150px] md:h-[200px] object-cover group-hover:scale-105 transition-transform duration-300 rounded-xl" />

                                            <div class="text-primary text-[18px] font-[400] text-center py-2">
                                                {{ $category->name }}
                                            </div>

                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </section>

    <!-- performaqnce section  -->

    <section class="bg-[#F5F5F5] py-12 md:py-16">
        <div class="max-w-8xl mx-auto px-6 md:px-8">

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8 md:gap-6">

                <div class="flex flex-col items-center text-center" data-aos="fade-up" data-aos-delay="0">
                    <img src="assets/images/production.png" alt="Production" class="w-[50px] h-[50px] mb-3">
                    <span class="text-[18px] md:text-[20px] font-[500] text-primary">Scalable Production</span>
                    <p class="text-[14px] md:text-[16px] text-secondary font-[400] mt-2 max-w-[250px]">
                        Thousands of pieces delivered monthly
                    </p>
                </div>

                <div class="flex flex-col items-center text-center" data-aos="fade-up" data-aos-delay="150">
                    <img src="assets/images/timeline.png" alt="Timeline" class="w-[50px] h-[50px] mb-3">
                    <span class="text-[18px] md:text-[20px] font-[500] text-primary">Efficient Timelines</span>
                    <p class="text-[14px] md:text-[16px] text-secondary font-[400] mt-2 max-w-[250px]">
                        On-time delivery, every single time
                    </p>
                </div>

                <div class="flex flex-col items-center text-center" data-aos="fade-up" data-aos-delay="300">
                    <img src="assets/images/settings.png" alt="Quality" class="w-[50px] h-[50px] mb-3">
                    <span class="text-[18px] md:text-[20px] font-[500] text-primary">Exceptional Quality</span>
                    <p class="text-[14px] md:text-[16px] text-secondary font-[400] mt-2 max-w-[250px]">
                        98% quality pass rate guaranteed
                    </p>
                </div>

                <div class="flex flex-col items-center text-center" data-aos="fade-up" data-aos-delay="450">
                    <img src="assets/images/world.png" alt="Global" class="w-[50px] h-[50px] mb-3">
                    <span class="text-[18px] md:text-[20px] font-[500] text-primary">Global Reach</span>
                    <p class="text-[14px] md:text-[16px] text-secondary font-[400] mt-2 max-w-[250px]">
                        Serving brands in 20+ countries
                    </p>
                </div>

            </div>
        </div>
    </section>

    <!-- product section  -->

    <section class="relative overflow-hidden">

        <!-- BG Decorative Image — TOP CENTER -->
        <div class="absolute top-0 left-1/2 -translate-x-1/2 pointer-events-none">
            <img src="assets/images/Group 3.png" alt="" class="w-full h-auto" />
        </div>

        <div class="max-w-8xl mx-auto px-4 md:px-8 relative z-10">

            <!-- Section Header -->
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-2 md:gap-4 mb-4 md:mb-8"
                data-aos="fade-up">

                <h2 class="text-[26px] md:text-[40px] lg:text-[48px] font-[400] text-[#404040] italic leading-tight">
                    Artistry in Textiles
                </h2>

                <a href="{{ url('products') }}"
                    class="text-sm font-medium text-primary hover:text-brand transition-colors flex items-center gap-1 group">
                    View All
                    <svg class="w-4 h-4 transition-transform group-hover:translate-x-1" fill="none"
                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>

            </div>

            <!-- Products Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                @foreach ($retailerProduct as $retpro)
                    <!-- Card 1 -->
                    <a href="{{ url('products/' . $retpro->slug) }}"
                        class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group"
                        data-aos="fade-up" data-aos-delay="{{ $loop->index * 100 }}">

                        <!-- Product Image -->
                        <div class="relative overflow-hidden">

                            <img src="{{ asset($retpro->primary_image_url ?? 'assets/images/no-image.png') }}"
                                alt="{{ $retpro->name }}"
                                class="w-full h-[180px] md:h-[260px] object-cover group-hover:scale-105 transition-transform duration-300" />

                            <!-- Cart Button -->
                            <!-- Cart Button -->
                            <button
                                @auth
onclick="event.preventDefault(); event.stopPropagation(); addToCart({{ $retpro->id }})"
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

                        <!-- Product Content -->
                        <div class="p-3">

                            <!-- Category -->
                            <p class="text-[12px] font-semibold tracking-widest text-brand uppercase mb-1">

                                {{ $retpro->productcategory->name ?? 'Category' }}

                            </p>

                            <!-- Product Name -->
                            <h3 class="text-[18px] font-semibold text-primary mb-1">

                                {{ $retpro->name }}

                            </h3>

                            <!-- Description -->
                            <p class="text-[16px] text-secondary leading-relaxed mb-3 line-clamp-2">

                                {{ Str::limit(strip_tags($retpro->description), 70) }}

                            </p>

                            <!-- Price & MOQ -->
                            <div class="flex items-center justify-between">

                                <span class="text-[16px] font-bold text-primary">

                                    ₹ {{ $retpro->price }}

                                </span>

                                @if ($retpro->moq)
                                    <span class="text-[12px] text-secondary">
                                        MOQ: {{ $retpro->moq }}
                                    </span>
                                @endif

                            </div>

                        </div>

                    </a>
                @endforeach


            </div>
        </div>

        <div class="max-w-8xl mx-auto px-4 md:px-8 relative z-10 mt-8">

            <!-- Section Header -->
            <div class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-2 md:gap-4 mb-4 md:mb-8"
                data-aos="fade-up">

                <h2 class="text-[26px] md:text-[40px] lg:text-[48px] font-[400] text-[#404040] italic leading-tight">
                    Wholesale & Bulk Orders
                </h2>

                <a href="{{ url('products') }}"
                    class="text-sm font-medium text-primary hover:text-brand transition-colors flex items-center gap-1 group">
                    View All
                    <svg class="w-4 h-4 transition-transform group-hover:translate-x-1" fill="none"
                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>

            </div>

            <!-- Products Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                @foreach ($wholesellerProduct as $whopro)
                    <a href="{{ url('products/' . $whopro->slug) }}"
                        class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group"
                        data-aos="fade-up" data-aos-delay="{{ $loop->index * 100 }}">

                        <!-- Product Image -->
                        <div class="relative overflow-hidden">

                            <img src="{{ asset($whopro->primary_image_url ?? 'assets/images/no-image.png') }}"
                                alt="{{ $whopro->name }}"
                                class="w-full h-[180px] md:h-[260px] object-cover group-hover:scale-105 transition-transform duration-300" />

                            <!-- Cart Button -->

                            <button
                                @auth
onclick="event.preventDefault(); event.stopPropagation(); addToCart({{ $whopro->id }})"
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

                        <!-- Product Content -->
                        <div class="p-3">

                            <!-- Category -->
                            <p class="text-[12px] font-semibold tracking-widest text-brand uppercase mb-1">

                                {{ $whopro->productcategory->name ?? 'Category' }}

                            </p>

                            <!-- Product Name -->
                            <h3 class="text-[18px] font-semibold text-primary mb-1">

                                {{ $whopro->name }}

                            </h3>

                            <!-- Description -->
                            <p class="text-[16px] text-secondary leading-relaxed mb-3 line-clamp-2">

                                {{ Str::limit(strip_tags($whopro->description), 70) }}

                            </p>

                            <!-- Price & MOQ -->
                            <div class="flex items-center justify-between">

                                <span class="text-[16px] font-bold text-primary">

                                    ₹ {{ $whopro->price }}

                                </span>

                                @if ($whopro->moq)
                                    <span class="text-[12px] text-secondary">
                                        MOQ: {{ $whopro->moq }}
                                    </span>
                                @endif

                            </div>

                        </div>

                    </a>
                @endforeach

            </div>
        </div>

        <!-- BG Decorative Image — BOTTOM CENTER -->
        <div class="absolute bottom-0 left-1/2 -translate-x-1/2 pointer-events-none">
            <img src="assets/images/Group4.png" alt="" class="w-64 h-auto" />
        </div>

    </section>

    <!-- ===================== FEATURED COLLECTION SECTION ===================== -->
    <section class="relative overflow-hidden" style="background: linear-gradient(135deg, #404040, #1F2937);">

        <!-- Decorative BG image -->
        <div class="absolute right-[-200px] top-1/2 -translate-y-1/2 opacity-10 pointer-events-none">
            <img src="{{ asset('assets/images/Group 3.png') }}" alt="" class="h-[600px] w-[600px]" />
        </div>

        <div class="max-w-8xl mx-auto px-4 md:px-8 relative z-10">

            <!-- Section Heading -->
            <div class="text-center mb-8 md:mb-12 px-4" data-aos="fade-up">

                <p
                    class="text-[10px] md:text-[11px] font-semibold tracking-[3px] md:tracking-[4px] text-brand uppercase mb-3">
                    Spotlight
                </p>

                <h2 class="text-[26px] md:text-[40px] lg:text-[48px] font-[400] text-white italic leading-tight mb-4">
                    Featured Collection
                </h2>

                <p class="text-[#D1D5DB] text-sm md:text-base max-w-md md:max-w-xl mx-auto leading-relaxed">
                    Our hand-picked selection of premium textiles, curated for discerning brands.
                </p>

            </div>

            <!-- Products Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">

                @foreach ($featuredProducts as $product)
                    <a href="{{ url('products/' . $product->slug) }}"
                        class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group"
                        data-aos="fade-up" data-aos-delay="{{ $loop->index * 100 }}">

                        <!-- Product Image -->
                        <div class="relative overflow-hidden">

                            <img src="{{ asset($product->primary_image_url ?? 'assets/images/no-image.png') }}"
                                alt="{{ $product->name }}"
                                class="w-full h-[180px] md:h-[260px] object-cover group-hover:scale-105 transition-transform duration-300" />

                            <!-- Cart Button -->
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

                        <!-- Product Content -->
                        <div class="p-3">

                            <!-- Category -->
                            <p class="text-[12px] font-semibold tracking-widest text-brand uppercase mb-1">

                                {{ $product->productcategory->name ?? 'Category' }}

                            </p>

                            <!-- Product Name -->
                            <h3 class="text-[18px] font-semibold text-primary mb-1">

                                {{ $product->name }}

                            </h3>

                            <!-- Description -->
                            <p class="text-[16px] text-secondary leading-relaxed mb-3 line-clamp-2">

                                {{ Str::limit(strip_tags($product->description), 70) }}

                            </p>

                            <!-- Price & MOQ -->
                            <div class="flex items-center justify-between">

                                <span class="text-[16px] font-bold text-primary">

                                    ₹ {{ $product->price }}

                                </span>

                                @if ($product->moq)
                                    <span class="text-[12px] text-secondary">
                                        MOQ: {{ $product->moq }}
                                    </span>
                                @endif

                            </div>

                        </div>

                    </a>
                @endforeach

            </div>

        </div>

    </section>



    <!-- ===================== TRENDING NOW SECTION ===================== -->
    <section class="bg-light overflow-hidden">
        <div class="max-w-8xl mx-auto px-4 md:px-8">

            <!-- Header -->
            <div class="flex items-center justify-between mb-6" data-aos="fade-up">
                <h2 class="text-[28px] md:text-[48px] font-[400] text-primary italic px-4 py-1">Trending Now</h2>
                <a href="{{ url('products') }}"
                    class="text-sm text-primary hover:text-brand transition-colors flex items-center gap-1">
                    View All
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>
            </div>

            <!-- Layout: Left big + Right 2x2 -->
            <div class="flex flex-col md:flex-row gap-8 h-auto md:h-[762px]">
                <!-- Left — Big Video/Image Card -->
                <div class="w-full md:w-[45%] shrink-0 relative overflow-hidden group cursor-pointer"
                    data-aos="fade-right">
                    <img src="assets/images/IMAGE (2).png" alt="Linen Heritage"
                        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                    <div class="absolute inset-0 bg-black/30"></div>
                    <div class="absolute inset-0 flex items-center justify-center">
                        <div
                            class="w-15 md:w-25 h-15 md:h-25  rounded-full bg-white/20 backdrop-blur-sm border border-white/40 flex items-center justify-center hover:bg-white/30 transition-colors">
                            <svg class="w-15 h-15 text-white ml-1" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M8 5v14l11-7z" />
                            </svg>
                        </div>
                    </div>
                    <button
                        class="absolute top-3 right-3 bg-brand/90 text-primary p-2 rounded-md hover:bg-brand transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <circle cx="9" cy="21" r="1" />
                            <circle cx="20" cy="21" r="1" />
                            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6" />
                        </svg>
                    </button>
                    <div class="absolute bottom-0 left-0 right-0 p-4">
                        <h3 class="text-white text-[35px] font-[500]">Linen Heritage</h3>
                        <p class="text-white/80 text-[13px]">Breathable premium cotton with traditional weaving patterns
                        </p>
                    </div>
                </div>

                <!-- Right — 2x2 Grid -->
                <div class="flex-1 relative" data-aos="fade-left">
                    <div class="absolute inset-0 flex items-center justify-center pointer-events-none z-0">
                        <img src="{{ url('assets/images/Group 3.png') }}" alt="group3" />
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-1 lg:grid-cols-2 gap-8 items-start relative z-[1]">

                        @foreach ($trendingProduct as $product)
                            <a href="{{ url('products/' . $product->slug) }}"
                                class="block bg-white overflow-hidden shadow-sm hover:shadow-md transition-shadow group"
                                data-aos="fade-up" data-aos-delay="{{ $loop->index * 100 }}">

                                <div class="relative overflow-hidden">
                                    <img src="{{ $product->primary_image_url }}" alt="{{ $product->name }}"
                                        class="w-full h-[160px] md:h-[200px] object-cover group-hover:scale-105 transition-transform duration-300" />
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
                                        {{ $product->productcategory->name ?? $product->category }}
                                    </p>
                                    <h3 class="text-[18px] font-semibold text-primary mb-1">{{ $product->name }}</h3>
                                    <p class="text-[16px] text-secondary leading-relaxed mb-3 line-clamp-2">
                                        {{ Str::limit(strip_tags($product->description), 70) }}
                                    </p>
                                    <div class="flex items-center justify-between">
                                        <span class="text-[16px] font-bold text-primary">₹ {{ $product->price }}</span>
                                        @if ($product->moq)
                                            <span class="text-[12px] text-secondary">MOQ: {{ $product->moq }}</span>
                                        @endif
                                    </div>
                                </div>

                            </a>
                        @endforeach

                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- ===================== HERITAGE & CRAFT SECTION ===================== -->
    <section class="bg-white overflow-hidden">
        <div class="max-w-8xl mx-auto px-4 md:px-8">
            <div class="flex flex-col md:flex-row items-center gap-3 md:gap-10">

                <!-- Left — Overlapping Circle Images -->
                <div class="relative w-full md:w-[40%] h-[280px] md:h-[350px] shrink-0" data-aos="fade-right">

                    <div
                        class="absolute top-0 left-4 md:left-auto md:right-20 w-[220px] h-[220px] md:w-[300px] md:h-[300px] rounded-full overflow-hidden border-4 border-white shadow-lg z-[1]">
                        <img src="assets/images/IMAGE (4).png" alt="Fabric Store" class="w-full h-full object-cover" />
                    </div>

                    <div
                        class="absolute bottom-4 right-4 md:bottom-0 md:right-0 w-[140px] h-[140px] md:w-[180px] md:h-[180px] rounded-full overflow-hidden border-4 border-white shadow-lg z-[2]">
                        <img src="assets/images/IMAGE (10).png" alt="Fabric Detail" class="w-full h-full object-cover" />
                    </div>

                </div>
                <!-- Right — Content -->
                <div class="flex-1" data-aos="fade-left">
                    <p class="text-[11px] font-semibold tracking-[4px] text-brand uppercase mb-3">Heritage & Craft</p>
                    <h2 class="text-[32px] md:text-[38px] font-bold text-primary italic leading-tight mb-6">
                        Create Your Own Fabric <br />Design your fabric your way...
                    </h2>
                    <ul class="space-y-3 mb-8">
                        <li class="flex items-start gap-3 text-[15px] text-primary">
                            <svg class="w-4 h-4 text-brand shrink-0 mt-0.5" fill="none" stroke="currentColor"
                                stroke-width="2.5" viewBox="0 0 24 24">
                                <path d="m20 6-11 11-5-5" />
                            </svg>
                            Exquisite hand-embroidered paisley motifs
                        </li>
                        <li class="flex items-start gap-3 text-[15px] text-primary">
                            <svg class="w-4 h-4 text-brand shrink-0 mt-0.5" fill="none" stroke="currentColor"
                                stroke-width="2.5" viewBox="0 0 24 24">
                                <path d="m20 6-11 11-5-5" />
                            </svg>
                            Luxurious silk base with subtle sheen
                        </li>
                        <li class="flex items-start gap-3 text-[15px] text-primary">
                            <svg class="w-4 h-4 text-brand shrink-0 mt-0.5" fill="none" stroke="currentColor"
                                stroke-width="2.5" viewBox="0 0 24 24">
                                <path d="m20 6-11 11-5-5" />
                            </svg>
                            Perfectly tailored silhouette for effortless layering
                        </li>
                        <li class="flex items-start gap-3 text-[15px] text-primary">
                            <svg class="w-4 h-4 text-brand shrink-0 mt-0.5" fill="none" stroke="currentColor"
                                stroke-width="2.5" viewBox="0 0 24 24">
                                <path d="m20 6-11 11-5-5" />
                            </svg>
                            A timeless statement piece of heirloom quality
                        </li>
                    </ul>
                    <a href="{{ url('/') }}"
                        class="inline-block bg-primary text-white text-[14px] font-medium px-7 py-3 rounded hover:bg-primary/90 transition-colors">
                        Start custom design
                    </a>
                </div>

            </div>
        </div>
    </section>

    <!-- ===================== TESTIMONIALS SECTION ===================== -->
    <section class="bg-light overflow-hidden">
        <div class="max-w-8xl mx-auto px-4 md:px-8">

            <!-- Section Heading -->
            <div class="text-center mb-10" data-aos="fade-up">
                <p class="text-[11px] font-semibold tracking-[4px] text-brand uppercase mb-3">Voices of Trust</p>
                <h2 class="text-[32px] md:text-[38px] font-bold text-primary italic mb-2">What Our Clients Say</h2>
                <p class="text-secondary text-[14px]">Trusted by designers and brands across the globe</p>
            </div>

            <!-- Testimonials Swiper -->
            <div class="relative" data-aos="fade-up" data-aos-delay="100">

                <button
                    class="testimonial-prev absolute -left-5 top-1/2 -translate-y-1/2 z-10 w-9 h-9 bg-white rounded-full shadow-md flex items-center justify-center hover:bg-brand hover:text-white transition-colors text-primary">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m15 18-6-6 6-6" />
                    </svg>
                </button>

                <button
                    class="testimonial-next absolute -right-5 top-1/2 -translate-y-1/2 z-10 w-9 h-9 bg-white rounded-full shadow-md flex items-center justify-center hover:bg-brand hover:text-white transition-colors text-primary">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </button>

                <div class="swiper testimonial-swiper">
                    <div class="swiper-wrapper">

                        <!-- Review Card 1 -->
                        @foreach ($reviews as $review)
                            <div class="swiper-slide">
                                <div class="bg-white p-5 h-full flex flex-col justify-between shadow-sm">

                                    {{-- Stars --}}
                                    <div class="flex gap-1 mb-4">
                                        @for ($i = 1; $i <= 5; $i++)
                                            <svg class="w-4 h-4 {{ $i <= $review->rating ? 'text-brand fill-brand' : 'text-gray-200 fill-gray-200' }}"
                                                viewBox="0 0 24 24">
                                                <path
                                                    d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                                            </svg>
                                        @endfor
                                    </div>

                                    {{-- Review Body --}}
                                    <p class="text-[14px] text-primary leading-relaxed flex-1 mb-5">
                                        "{{ Str::limit($review->body, 150) }}"
                                    </p>

                                    {{-- Reviewer Info --}}
                                    {{-- Reviewer Info --}}
                                    <div class="flex items-center gap-3">
                                        <div
                                            class="w-10 h-10 rounded-full bg-brand/20 flex items-center justify-center shrink-0">
                                            <span class="text-brand font-bold text-[14px]">
                                                {{ strtoupper(substr($review->reviewer_name, 0, 1)) }}
                                            </span>
                                        </div>
                                        <div>
                                            <p class="text-[14px] font-semibold text-primary">{{ $review->reviewer_name }}
                                            </p>
                                            <div class="flex items-center gap-2 flex-wrap mt-0.5">
                                                @if ($review->verified_purchase)
                                                    <span
                                                        class="flex items-center gap-1 bg-green-50 text-green-600 text-[10px] font-medium px-2 py-0.5 rounded-full border border-green-100">
                                                        <svg class="w-3 h-3" fill="none" stroke="currentColor"
                                                            stroke-width="2.5" viewBox="0 0 24 24">
                                                            <path d="M20 6 9 17l-5-5" />
                                                        </svg>
                                                        Verified Purchase
                                                    </span>
                                                @endif
                                                @if ($review->product)
                                                    <span class="text-[11px] text-secondary">•
                                                        {{ $review->product->name }}</span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        @endforeach


                    </div>
                </div>
            </div>

        </div>
    </section>
@endsection
