# frozen_string_literal: true

FactoryBot.define do
  factory :legal_document do
    content { FFaker::Book.description }
    online { true }
    online_at { DateTime.now }
    nature { %i[cgu cgv].sample }
  end
end
