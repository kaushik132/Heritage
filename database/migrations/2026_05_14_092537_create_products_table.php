<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
        $table->string('name');
        $table->string('slug')->unique();
        $table->string('category'); // Silk, Cotton, etc.
        $table->text('short_description')->nullable();
        $table->longText('description')->nullable();
        $table->decimal('price', 10, 2);
        $table->integer('moq')->default(50); // Minimum Order Quantity
        $table->integer('stock')->default(0);
        $table->boolean('in_stock')->default(true);
        $table->integer('weight')->nullable(); // GSM
        $table->string('width')->nullable(); // inches
        $table->string('weave')->nullable();
        $table->string('origin')->nullable();
        $table->string('composition')->nullable();
        $table->string('care_instructions')->nullable();
        $table->string('india_shipping')->nullable();
        $table->string('international_shipping')->nullable();
        $table->json('colors')->nullable(); // ['Green','Maroon','Blue','Gold']
        $table->decimal('rating', 3, 1)->default(0);
        $table->integer('review_count')->default(0);
        $table->boolean('is_featured')->default(false);
        $table->boolean('is_active')->default(true);
        $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
