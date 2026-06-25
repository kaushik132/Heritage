<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Support\Str;

class ProductController extends AdminController
{
    protected $title = 'Product';

    protected function grid()
    {
        $grid = new Grid(new Product());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('slug', __('Slug'));
        $grid->column('category', __('Category'));
        $grid->column('price', __('Price'));
        $grid->column('moq', __('Moq'));
        $grid->column('stock', __('Stock'));
        $grid->column('in_stock', __('In stock'))->bool();
        $grid->column('colors', __('Colors'))->display(function ($colors) {
            if (is_string($colors)) {
                $colors = json_decode($colors, true);
            }
            return is_array($colors) ? implode(', ', $colors) : $colors;
        });
        $grid->column('rating', __('Rating'));
        $grid->column('is_featured', __('Is featured'))->bool();
        $grid->column('is_active', __('Is active'))->bool();
        $grid->column('type', __('Type'));
        $grid->column('created_at', __('Created at'))->display(fn($val) => \Carbon\Carbon::parse($val)->format('d M Y'));

        return $grid;
    }

    protected function detail($id)
    {
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('slug', __('Slug'));
        $show->field('category', __('Category'));
        $show->field('short_description', __('Short description'));
        $show->field('description', __('Description'));
        $show->field('price', __('Price'));
        $show->field('moq', __('Moq'));
        $show->field('stock', __('Stock'));
        $show->field('in_stock', __('In stock'));
        $show->field('weight', __('Weight'));
        $show->field('width', __('Width'));
        $show->field('weave', __('Weave'));
        $show->field('origin', __('Origin'));
        $show->field('composition', __('Composition'));
        $show->field('care_instructions', __('Care instructions'));
        $show->field('india_shipping', __('India shipping'));
        $show->field('international_shipping', __('International shipping'));
        $show->field('colors', __('Colors'))->as(function ($colors) {
            if (is_string($colors)) {
                $colors = json_decode($colors, true);
            }
            return is_array($colors) ? implode(', ', $colors) : $colors;
        });
        $show->field('rating', __('Rating'));
        $show->field('review_count', __('Review count'));
        $show->field('is_featured', __('Is featured'));
        $show->field('is_active', __('Is active'));
        $show->field('type', __('Type'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    protected function form()
    {
        $form = new Form(new Product());

        // ─── Saving ───────────────────────────────────────
        $form->saving(function (Form $form) {
            // Slug generate karo
            if ($form->name) {
                $form->slug = Str::slug($form->name);
            }

            // colors_raw ko colors mein convert karke save karo
            $colorsRaw = request()->input('colors_raw', '');
            if (!empty(trim($colorsRaw))) {
                $colors = array_values(array_filter(
                    array_map('trim', explode(',', $colorsRaw)),
                    fn($c) => !empty($c)
                ));
                $form->model()->colors = $colors;
            }
        });

        // ─── Editing ──────────────────────────────────────
        $form->editing(function (Form $form) {
            // colors array ko string mein set karo for display
            $colors = $form->model()->colors;
            if (is_array($colors)) {
                $form->model()->setAttribute('colors_display', implode(', ', $colors));
            }
        });

        // ─── Tab 1: Product Info ──────────────────────────
        $form->tab('Product Info', function ($form) {

            $form->text('name', __('Name'))->required();
            $form->hidden('slug');

            $form->select('category', __('Category'))
                ->options(ProductCategory::pluck('name', 'id'))
                ->required();

            $form->textarea('short_description', __('Short Description'));
            $form->textarea('description', __('Description'));

            $form->decimal('price', __('Price'))->required();
            $form->number('moq', __('Min Order Qty'))->default(50);
            $form->number('stock', __('Stock'))->default(0);
            $form->switch('in_stock', __('In Stock'))->default(1);

            $form->number('weight', __('Weight (GSM)'));
            $form->text('width', __('Width'));
            $form->text('weave', __('Weave'));
            $form->text('origin', __('Origin'));
            $form->text('composition', __('Composition'));
            $form->text('care_instructions', __('Care Instructions'));
            $form->text('india_shipping', __('India Shipping'));
            $form->text('international_shipping', __('International Shipping'));

            // Colors — HTML field use karo (database column nahi hai)
            $form->html(function (Form $form) {
                $colors = $form->model()->colors ?? [];
                $value  = is_array($colors) ? implode(', ', $colors) : '';
                return '
                <div class="form-group">
                    <label class="col-sm-2 control-label">Colors</label>
                    <div class="col-sm-8">
                        <input
                            type="text"
                            name="colors_raw"
                            value="' . htmlspecialchars($value) . '"
                            class="form-control"
                            placeholder="Green, Maroon, Blue, Gold" />
                        <p class="help-block">Comma se alag karo. Example: Green, Maroon, Blue</p>
                    </div>
                </div>';
            }, '');

            $form->decimal('rating', __('Rating'))->default(0.0);
            $form->number('review_count', __('Review Count'))->default(0);
            $form->switch('is_featured', __('Is Featured'))->default(0);
            $form->switch('is_active', __('Is Active'))->default(1);
            $form->select('type', __('Type'))
                ->options(['retailer' => 'Retailer', 'wholeseller' => 'Wholesaler']);
        });

        // ─── Tab 2: Product Images ────────────────────────
        $form->tab('Product Images', function ($form) {
            $form->hasMany('images', 'Images', function (Form\NestedForm $form) {
                $form->number('sort_order', __('Order'))->default(0);
                $form->text('color', __('Color'))->placeholder('e.g. Green');
                $form->image('image_path', __('Image'))
                    ->move('products')
                    ->uniqueName();
                $form->switch('is_primary', __('Is Primary'))->default(0);
            });
        });
        $form->tab('Seo', function ($form) {
            $form->textarea('seo_title', __('Seo Title'));
            $form->textarea('seo_description', __('Seo Description'));
            $form->textarea('seo_keyword', __('Seo Keyword'));
        });
        return $form;
    }
}
