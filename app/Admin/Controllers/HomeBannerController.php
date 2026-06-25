<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\HomeBanner;

class HomeBannerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'HomeBanner';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new HomeBanner());

        $grid->column('id', __('Id'));
        $grid->column('image', __('Image'))->image('/uploads/', 100, 100);
        $grid->column('title', __('Title'));
        $grid->column('short_description', __('Short description'));

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
        $show = new Show(HomeBanner::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('image', __('Image'));
        $show->field('title', __('Title'));
        $show->field('short_description', __('Short description'));
        $show->field('explore_link', __('Explore link'));
        $show->field('start_custom_link', __('Start custom link'));
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
        $form = new Form(new HomeBanner());

        $form->image('image', __('Image'));
        $form->text('title', __('Title'));
        $form->textarea('short_description', __('Short description'));
        $form->text('explore_link', __('Explore link'));
        $form->text('start_custom_link', __('Start custom link'));
        $form->text('alt', __('Alt text'));
        $form->switch('is_active', __('Is active'));


        return $form;
    }
}
