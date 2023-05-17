# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'category' }

    clothing_model
  end
end
