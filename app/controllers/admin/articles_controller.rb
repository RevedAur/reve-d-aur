# frozen_string_literal: true

module Admin
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show edit update]

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        flash[:notice] = 'Article was successfully created'
        redirect_to admin_articles_path
      else
        flash.now[:alert] = 'An error has occurred'
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @article_colors = Color.where(id: @article.colors.select(:color_id))
      @article_sizes = Size.where(id: @article.sizes.select(:size_id))
    end

    def edit; end

    def update
      @article.assign_attributes(article_params)

      if @article.save
        flash[:notice] = 'Article was successfully updated'
        redirect_to admin_articles_path
      else
        flash.now[:alert] = 'An error has occurred'
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def article_params
      params.require(:article)
            .permit(:title, :reference, :description, :status, :price, :delivery_price, :category_id, color_ids: [], size_ids: [], images: [])
    end

    def set_article
      @article = Article.find(params[:id])
    end
  end
end
