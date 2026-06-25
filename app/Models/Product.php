<?php
// app/Models/Product.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
         'name',
    'slug',
    'category',
    'short_description',
    'description',
    'price',
    'moq',
    'stock',
    'in_stock',
    'weight',
    'width',
    'weave',
    'origin',
    'composition',
    'care_instructions',
    'india_shipping',
    'international_shipping',
    'colors',
    'rating',
    'review_count',
    'is_featured',
    'is_active',
    'type', // ADD THIS
    ];

    protected $casts = [
        'colors'   => 'array',
        'in_stock' => 'boolean',
        'is_featured' => 'boolean',
        'is_active'   => 'boolean',
        'price'    => 'decimal:2',
        'rating'   => 'decimal:1',
    ];

    public function productcategory(){
        return $this->belongsTo(ProductCategory::class,'category','id');
    }

    // ─── Relationships ────────────────────────────────
    public function inquiry()
    {
        return $this->hasMany(Inquiry::class);
    }
    public function images()
    {
        return $this->hasMany(ProductImage::class,'product_id')->orderBy('sort_order');
    }

    public function primaryImage()
    {
        return $this->hasOne(ProductImage::class)->where('is_primary', true);
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class)->where('is_approved', true)->latest();
    }

    // ─── Helpers ──────────────────────────────────────
    public function getPrimaryImageUrlAttribute(): string
    {
        $img = $this->primaryImage;

        if (!$img) {
            return 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=220&fit=crop';
        }

        // Agar http URL hai to seedha return karo
        if (str_starts_with($img->image_path, 'http')) {
            return $img->image_path;
        }

        // Local file — uploads folder se
        return asset('uploads/' . $img->image_path);
    }

    public function getFormattedPriceAttribute(): string
    {
        return '₹ ' . number_format($this->price, 2);
    }

    // Rating breakdown for review section
    public function getRatingBreakdownAttribute(): array
    {
        $breakdown = [];
        for ($i = 5; $i >= 1; $i--) {
            $count = $this->reviews()->where('rating', $i)->count();
            $breakdown[$i] = [
                'count' => $count,
                'percent' => $this->review_count > 0
                    ? round(($count / $this->review_count) * 100)
                    : 0,
            ];
        }
        return $breakdown;
    }

    // Collection return karo array nahi
public function imagesByColor(): \Illuminate\Support\Collection
{
    return $this->images->groupBy(function($image) {
        return $image->color ?? 'default';
    });
}

}
