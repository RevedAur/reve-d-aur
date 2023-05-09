# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    amount { 10 }
    paid_at { DateTime.now }
    
    order
    user
  end
end
