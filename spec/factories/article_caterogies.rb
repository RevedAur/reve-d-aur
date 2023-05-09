# frozen_string_literal: true

FactoryBot.define do
  factory :article_category do
    article
    category
  end
end
