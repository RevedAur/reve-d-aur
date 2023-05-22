# frozen_string_literal: true

module Account
  class CartController < Account::BaseController
    def show
      @cart = current_user.cart
    end
  end
end
