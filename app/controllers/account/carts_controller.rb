# frozen_string_literal: true

module Account
  class CartsController < Account::BaseController
    def show
      @cart = current_user.cart
    end

    def update
      article = Article.find(params[:article_id])
      CartArticle.create!(article: article, cart: current_user.cart)

      flash[:notice] = 'Article ajouté au panier'
      redirect_back(fallback_location: root_path)
    end
  end
end
