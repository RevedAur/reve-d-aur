# frozen_string_literal: true

FactoryBot.define do
  factory :cart_article do
    cart
    article
  end
end
