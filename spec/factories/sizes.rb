# frozen_string_literal: true

FactoryBot.define do
  factory :size do
    name { Size.names.keys.sample }
  end
end
