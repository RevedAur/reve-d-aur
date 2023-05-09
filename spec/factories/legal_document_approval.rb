# frozen_string_literal: true

FactoryBot.define do
  factory :legal_document_approval do
    approved_at { nil }

    user
    legal_document
  end
end
