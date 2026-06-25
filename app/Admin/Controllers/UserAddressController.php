<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\UserAddress;

class UserAddressController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'UserAddress';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UserAddress());

        $grid->column('id', __('Id'));
        $grid->column('user_id', __('User id'));
        $grid->column('first_name', __('First name'));
        $grid->column('last_name', __('Last name'));
        $grid->column('phone', __('Phone'));
        $grid->column('email', __('Email'));
        $grid->column('street_address', __('Street address'));
        $grid->column('city', __('City'));
        $grid->column('state', __('State'));
        $grid->column('zip_code', __('Zip code'));
        $grid->column('country', __('Country'));
        $grid->column('is_default', __('Is default'));
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
        $show = new Show(UserAddress::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('phone', __('Phone'));
        $show->field('email', __('Email'));
        $show->field('street_address', __('Street address'));
        $show->field('city', __('City'));
        $show->field('state', __('State'));
        $show->field('zip_code', __('Zip code'));
        $show->field('country', __('Country'));
        $show->field('is_default', __('Is default'));
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
        $form = new Form(new UserAddress());

        $form->number('user_id', __('User id'));
        $form->text('first_name', __('First name'));
        $form->text('last_name', __('Last name'));
        $form->phonenumber('phone', __('Phone'));
        $form->email('email', __('Email'));
        $form->text('street_address', __('Street address'));
        $form->text('city', __('City'));
        $form->text('state', __('State'));
        $form->text('zip_code', __('Zip code'));
        $form->text('country', __('Country'))->default('India');
        $form->switch('is_default', __('Is default'));

        return $form;
    }
}
