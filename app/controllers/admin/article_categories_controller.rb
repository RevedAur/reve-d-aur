# frozen_string_literal: true

module Admin
  class ArticleCategoriesController < ApplicationController
    def destroy
      @article = Article.find(params[:article])
      @category = Category.find(params[:id])
      ArticleCategory.find_by(article: @article, category: @category).destroy
      redirect_to admin_article_path(@article)
    end
  end
end