# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'password' }
    confirmation_token { SecureRandom.hex(6) }
    confirmed_at { DateTime.now }
    level { 'user' }
    deleted { false }
    deleted_by_admin { false }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    phone_number { FFaker::PhoneNumberFR.phone_number }
    birth_date { FFaker::Time.date }
  end
end
