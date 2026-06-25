<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    protected $table = 'product_images';
    protected $fillable = ['product_id', 'image_path', 'is_primary', 'sort_order', 'color'];

    public function getUrlAttribute(): string
    {
        if (str_starts_with($this->image_path, 'http')) {
            return $this->image_path;
        }
        return asset('uploads/' . $this->image_path);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
