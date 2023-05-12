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
        flash.now[:error] = "An error has occurred"
        render :new, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def article_params
      params.require(:article).permit(:title, :description, :status, :price, :delivery_price, :category_ids => [], :images => [])
    end

    def set_article
      @article = Article.find(params[:id])
    end
  end
end