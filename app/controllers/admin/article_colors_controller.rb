# frozen_string_literal: true

module Admin
  class ArticleColorsController < ApplicationController
    def destroy
      @article = Article.find(params[:article])
      @color = Color.find(params[:id])
      ArticleColor.find_by(article: @article, color: @color).destroy
      redirect_to admin_article_path(@article)
    end
  end
end
