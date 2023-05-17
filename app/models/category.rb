# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :clothing_model

  has_many :articles

  validates :name, presence: true
end
