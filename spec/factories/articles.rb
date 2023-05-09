# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    price { 1000 }
    delivery_price { 1000 }
    status { :draft }
  end
end
