<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Response;

class SitemapController extends Controller
{
    public function index()
    {
        $products   = Product::where('is_active', true)->select('slug', 'updated_at')->get();
        $categories = ProductCategory::select('slug', 'updated_at')->get();

        return response()
            ->view('sitemap', compact('products', 'categories'))
            ->header('Content-Type', 'application/xml');
    }
}
