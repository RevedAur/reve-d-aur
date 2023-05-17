# frozen_string_literal: true

FactoryBot.define do
  factory :professional do
    name { FFaker::Book.title }
    siret { FFaker::PhoneNumber.imei }

    user
  end
end
