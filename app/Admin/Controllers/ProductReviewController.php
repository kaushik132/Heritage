<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\ProductReview;

class ProductReviewController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ProductReview';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductReview());

        $grid->column('id', __('Id'));
        $grid->column('product_id', __('Product id'));
        $grid->column('user_id', __('User id'));
        $grid->column('reviewer_name', __('Reviewer name'));
        $grid->column('title', __('Title'));
        $grid->column('body', __('Body'));
        $grid->column('rating', __('Rating'));
        $grid->column('helpful_count', __('Helpful count'));
        $grid->column('verified_purchase', __('Verified purchase'));
        $grid->column('is_approved', __('Is approved'));
$grid->column('created_at', __('Created at'))->display(fn($val) => \Carbon\Carbon::parse($val)->format('d M Y'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ProductReview::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('product_id', __('Product id'));
        $show->field('user_id', __('User id'));
        $show->field('reviewer_name', __('Reviewer name'));
        $show->field('title', __('Title'));
        $show->field('body', __('Body'));
        $show->field('rating', __('Rating'));
        $show->field('helpful_count', __('Helpful count'));
        $show->field('verified_purchase', __('Verified purchase'));
        $show->field('is_approved', __('Is approved'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProductReview());

        $form->number('product_id', __('Product id'));
        $form->number('user_id', __('User id'));
        $form->text('reviewer_name', __('Reviewer name'));
        $form->text('title', __('Title'));
        $form->textarea('body', __('Body'));
        $form->number('rating', __('Rating'));
        $form->number('helpful_count', __('Helpful count'));
        $form->switch('verified_purchase', __('Verified purchase'));
        $form->switch('is_approved', __('Is approved'))->default(1);

        return $form;
    }
}
