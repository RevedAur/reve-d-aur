# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    street_address { FFaker::AddressFR.street_address }
    zip_code { FFaker::AddressFR.postal_code }
    city { FFaker::AddressFR.city }
    purchased_at { 20.days.ago }
    
    user
  end
end
