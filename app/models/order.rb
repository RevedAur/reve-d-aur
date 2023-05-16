# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :order_articles
  has_many :articles, through: :order_articles

  has_one :payment
end
