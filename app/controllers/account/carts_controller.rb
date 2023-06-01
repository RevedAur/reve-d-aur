# frozen_string_literal: true

module Account
  class CartsController < Account::BaseController
    def show
      @cart = current_user.cart
    end

    def create
      cart_article = AddArticle.new(cart_params, current_user).perform

      if cart_article.save
        flash[:notice] = 'Article ajouté au panier'
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = cart_article.errors.full_messages
        redirect_back(fallback_location: root_path)
      end
    end

    private

    def cart_params
      params.permit(:article_id, :size_id, :article_number, color_id: [])
    end
  end
end
