# frozen_string_literal: true

class Professional < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :siret, presence: true
end
