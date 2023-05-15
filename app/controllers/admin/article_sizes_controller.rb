# frozen_string_literal: true

module Admin
  class ArticleSizesController < ApplicationController
    def destroy
      @article = Article.find(params[:article])
      @size = Size.find(params[:id])
      ArticleSize.find_by(article: @article, size: @size).destroy
      redirect_to admin_article_path(@article)
    end

    def update
      @article_size = ArticleSize.find(params[:id])
      @article_size.update(number: params[:number])
      @article = @article_size.article

      redirect_to admin_article_path(@article)
    end
  end
end