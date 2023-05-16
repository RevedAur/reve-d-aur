# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_articles, dependent: :destroy
  has_many :articles, through: :cart_articles

  private

  def total_price
    articles.sum(&:price)
  end
end
