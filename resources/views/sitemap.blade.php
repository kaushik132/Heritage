<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

    {{-- Home --}}
    <url>
        <loc>{{ url('/') }}</loc>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    {{-- Static Pages --}}
    <url>
        <loc>{{ url('products') }}</loc>
        <changefreq>daily</changefreq>
        <priority>0.9</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    <url>
        <loc>{{ url('contact') }}</loc>
        <changefreq>monthly</changefreq>
        <priority>0.5</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    <url>
        <loc>{{ url('wishlist') }}</loc>
        <changefreq>weekly</changefreq>
        <priority>0.4</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    <url>
        <loc>{{ url('cart') }}</loc>
        <changefreq>weekly</changefreq>
        <priority>0.4</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    <url>
        <loc>{{ url('login') }}</loc>
        <changefreq>monthly</changefreq>
        <priority>0.3</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    <url>
        <loc>{{ url('register') }}</loc>
        <changefreq>monthly</changefreq>
        <priority>0.3</priority>
        <lastmod>{{ now()->toAtomString() }}</lastmod>
    </url>

    {{-- Product Categories --}}
    @foreach($categories as $category)
    <url>
        <loc>{{ url('products?category=' . urlencode($category->slug)) }}</loc>
        <changefreq>weekly</changefreq>
        <priority>0.7</priority>
        <lastmod>{{ $category->updated_at->toAtomString() }}</lastmod>
    </url>
    @endforeach

    {{-- Products --}}
    @foreach($products as $product)
    <url>
        <loc>{{ url('products/' . $product->slug) }}</loc>
        <changefreq>weekly</changefreq>
        <priority>0.8</priority>
        <lastmod>{{ $product->updated_at->toAtomString() }}</lastmod>
    </url>
    @endforeach

</urlset>
