<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class FixColorsJsonFormatInProducts extends Migration
{
    public function up()
    {
        $products = DB::table('products')->get();

        foreach ($products as $product) {
            $colors = $product->colors;

            // Agar already valid JSON array hai to skip karo
            if (!$colors || str_starts_with(trim($colors), '[')) {
                continue;
            }

            // Comma-separated string to JSON array
            $arr = array_values(array_filter(array_map('trim', explode(',', $colors))));
            DB::table('products')
                ->where('id', $product->id)
                ->update(['colors' => json_encode($arr)]);
        }
    }

    public function down()
    {
        // Rollback — JSON array to comma-separated string
        $products = DB::table('products')->get();

        foreach ($products as $product) {
            $colors = $product->colors;

            if (!$colors || !str_starts_with(trim($colors), '[')) {
                continue;
            }

            $arr = json_decode($colors, true);
            DB::table('products')
                ->where('id', $product->id)
                ->update(['colors' => implode(',', $arr)]);
        }
    }
}
