class Color < ApplicationRecord
  enum name: {
    noir: 0,
    blanc: 1,
    rouge: 2,
    jaune: 3,
    bleu: 4,
    vert: 5,
    marron: 6
  }

  validates :name, presence: true
  validates_uniqueness_of :name
end
