<?php
namespace Database\Seeders;

use App\Models\Product;
use App\Models\ProductImage;
use App\Models\ProductReview;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // Foreign key checks disable karo
        \DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        ProductReview::truncate();
        ProductImage::truncate();
        Product::truncate();
        \DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $product = Product::create([
            'name'                   => 'Heritage Silk Paisley',
            'slug'                   => 'heritage-silk-paisley',
            'category'               => 'Silk',
            'short_description'      => 'Exquisite hand-embroidered paisley motifs on luxurious silk base',
            'description'            => "Discover the epitome of luxury with our Heritage Silk Paisley fabric.\n\nThis exquisite textile is meticulously handcrafted by master artisans who have perfected their craft over generations.",
            'price'                  => 89.99,
            'moq'                    => 50,
            'stock'                  => 500,
            'in_stock'               => true,
            'weight'                 => 250,
            'width'                  => '54 inches',
            'weave'                  => 'Hand-loomed',
            'origin'                 => 'Jaipur, India',
            'composition'            => '100% Pure Silk',
            'care_instructions'      => 'Dry Clean Only',
            'india_shipping'         => '2-3 Business Days',
            'international_shipping' => '5-7 Business Days',
            'colors'                 => ['Green', 'Maroon', 'Blue', 'Gold'],
            'rating'                 => 4.8,
            'review_count'           => 4,
            'is_featured'            => true,
            'is_active'              => true,
        ]);

        $colorImages = [
            'Green'  => [
                'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=800&q=80',
                'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?w=800&q=80',
            ],
            'Maroon' => [
                'https://images.unsplash.com/photo-1544967082-d9d25d867d66?w=800&q=80',
                'https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99?w=800&q=80',
            ],
            'Blue'   => [
                'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&q=80',
                'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=800&q=80',
            ],
            'Gold'   => [
                'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=800&q=80',
                'https://images.unsplash.com/photo-1612336307429-8a898d10e223?w=800&q=80',
            ],
        ];

        $sortOrder = 0;
        foreach ($colorImages as $color => $urls) {
            foreach ($urls as $index => $url) {
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_path' => $url,
                    'is_primary' => ($color === 'Green' && $index === 0),
                    'sort_order' => $sortOrder++,
                    'color'      => $color,
                ]);
            }
        }

        $reviews = [
            ['name' => 'Priya Sharma', 'title' => 'Absolutely Stunning!', 'body' => 'The quality of this textile is exceptional. The craftsmanship is evident in every stitch. Highly recommend to anyone looking for premium fabrics. Worth every rupee spent on this beautiful fabric.', 'rating' => 5],
            ['name' => 'Rahul Mehta',  'title' => 'Great Quality',        'body' => 'Ordered 100 meters for my boutique. The color is exactly as shown and the fabric feels luxurious. My customers absolutely love the final products made from this fabric.', 'rating' => 4],
            ['name' => 'Sunita Patel', 'title' => 'Premium Fabric',       'body' => 'This silk fabric is truly premium. The weave is tight and the sheen is beautiful. Perfect for bridal wear. Will definitely order again for my next collection.', 'rating' => 5],
            ['name' => 'Amit Kumar',   'title' => 'Good but delayed',     'body' => 'The fabric quality is good but delivery was delayed by 2 days. Overall satisfied with the product. The color and texture are as described on the website.', 'rating' => 4],
        ];

        foreach ($reviews as $r) {
            ProductReview::create([
                'product_id'        => $product->id,
                'user_id'           => null,
                'reviewer_name'     => $r['name'],
                'title'             => $r['title'],
                'body'              => $r['body'],
                'rating'            => $r['rating'],
                'helpful_count'     => rand(5, 30),
                'verified_purchase' => true,
                'is_approved'       => true,
            ]);
        }
    }
}
