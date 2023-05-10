# frozen_string_literal: true

FactoryBot.define do
  factory :legal_document do
    online { true }
    online_at { DateTime.now }
    nature { %i[cgu cgv].sample }
  end
end
