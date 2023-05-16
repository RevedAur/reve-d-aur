# frozen_string_literal: true

module Admin
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        flash[:notice] = 'La catégorie a été créé avec succès'
        redirect_to admin_categories_path
      else
        flash.now[:error] = 'Un problème est survenu'
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      @category.assign_attributes(category_params)

      if @category.save
        flash[:notice] = 'La catégorie a été modifié avec succès'
        redirect_to admin_categories_path
      else
        flash.now[:error] = 'Un problème est survenu'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
  end
end
