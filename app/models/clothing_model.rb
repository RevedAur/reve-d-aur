class ClothingModel < ApplicationRecord
  has_many :categories
  has_many :articles, through: :categories
end
