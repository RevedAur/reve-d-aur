# frozen_string_literal: true

class AddArticle
  attr_accessor :user, :params

  def initialize(params, user)
    @params = params
    @user = user
  end

  def perform
    CartArticle.new(cart_params)
  end

  private

  def cart_params
    {
      article: article,
      color: color,
      cart: cart,
      size: size,
      article_number: article_number
    }
  end

  def article
    Article.find(params[:article_id])
  end

  def color
    Color.find(params[:color_id].first)
  end

  def cart
    user.cart
  end

  def size
    Size.find(params[:size_id])
  end

  def article_number
    params[:article_number]
  end
end
