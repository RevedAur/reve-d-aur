# frozen_string_literal: true

FactoryBot.define do
  factory :color do
    name { Color.names.keys.sample }
  end
end
