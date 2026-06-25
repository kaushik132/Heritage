<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\Inquiry;

class InquiryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Inquiry';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Inquiry());

        $grid->column('id', __('Id'));
     $grid->column('user_id', __('User'));
$grid->column('product.name', __('Product'));
        $grid->column('name', __('Name'));
        $grid->column('phone', __('Phone'));
        $grid->column('email', __('Email'));
        $grid->column('quantity', __('Quantity'));
        $grid->column('message', __('Message'));
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
        $show = new Show(Inquiry::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('product_id', __('Product id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('email', __('Email'));
        $show->field('quantity', __('Quantity'));
        $show->field('message', __('Message'));
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
        $form = new Form(new Inquiry());

        $form->number('user_id', __('User id'));
        $form->number('product_id', __('Product id'));
        $form->text('name', __('Name'));
        $form->phonenumber('phone', __('Phone'));
        $form->email('email', __('Email'));
        $form->text('quantity', __('Quantity'));
        $form->textarea('message', __('Message'));

        return $form;
    }
}
