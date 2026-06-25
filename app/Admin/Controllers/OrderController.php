<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\Order;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Order';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());

        $grid->column('id', __('Id'));
        $grid->column('user.first_name', __('User id'));
        $grid->column('order_number', __('Order number'));
        $grid->column('status', __('Status'));
        $grid->column('payment_method', __('Payment method'));
        $grid->column('payment_status', __('Payment status'));
        $grid->column('subtotal', __('Subtotal'));
        $grid->column('tax', __('Tax'));
        $grid->column('discount', __('Discount'));
        $grid->column('total', __('Total'));
        $grid->column('coupon_code', __('Coupon code'));
        $grid->column('first_name', __('First name'));
        $grid->column('last_name', __('Last name'));
        $grid->column('email', __('Email'));
        $grid->column('phone', __('Phone'));
        $grid->column('street_address', __('Street address'));
        $grid->column('city', __('City'));
        $grid->column('state', __('State'));
        $grid->column('zip_code', __('Zip code'));
        $grid->column('country', __('Country'));
        $grid->column('notes', __('Notes'));
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
        $show = new Show(Order::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('order_number', __('Order number'));
        $show->field('status', __('Status'));
        $show->field('payment_method', __('Payment method'));
        $show->field('payment_status', __('Payment status'));
        $show->field('subtotal', __('Subtotal'));
        $show->field('tax', __('Tax'));
        $show->field('discount', __('Discount'));
        $show->field('total', __('Total'));
        $show->field('coupon_code', __('Coupon code'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('email', __('Email'));
        $show->field('phone', __('Phone'));
        $show->field('street_address', __('Street address'));
        $show->field('city', __('City'));
        $show->field('state', __('State'));
        $show->field('zip_code', __('Zip code'));
        $show->field('country', __('Country'));
        $show->field('notes', __('Notes'));
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
        $form = new Form(new Order());

        $form->number('user_id', __('User id'));
        $form->text('order_number', __('Order number'));
        $form->text('status', __('Status'))->default('pending');
        $form->text('payment_method', __('Payment method'))->default('cod');
        $form->text('payment_status', __('Payment status'))->default('pending');
        $form->decimal('subtotal', __('Subtotal'))->default(0.00);
        $form->decimal('tax', __('Tax'))->default(0.00);
        $form->decimal('discount', __('Discount'))->default(0.00);
        $form->decimal('total', __('Total'))->default(0.00);
        $form->text('coupon_code', __('Coupon code'));
        $form->text('first_name', __('First name'));
        $form->text('last_name', __('Last name'));
        $form->email('email', __('Email'));
        $form->phonenumber('phone', __('Phone'));
        $form->text('street_address', __('Street address'));
        $form->text('city', __('City'));
        $form->text('state', __('State'));
        $form->text('zip_code', __('Zip code'));
        $form->text('country', __('Country'))->default('India');
        $form->textarea('notes', __('Notes'));

        return $form;
    }
}
