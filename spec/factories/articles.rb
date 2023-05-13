# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { FFaker::Book.title }
    reference { FFaker::PhoneNumber.imei }
    description { FFaker::Book.description }
    price { 1000 }
    delivery_price { 1000 }
    status { Article.statuses.keys.sample }
  end
end
