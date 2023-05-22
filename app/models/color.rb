# frozen_string_literal: true

class Color < ApplicationRecord
  enum name: {
    black: 0,
    white: 1,
    red: 2,
    yellow: 3,
    blue: 4,
    green: 5,
    brown: 6
  }

  validates :name, presence: true
  validates_uniqueness_of :name
end
