# frozen_string_literal: true

class CartArticle < ApplicationRecord
  belongs_to :cart
  belongs_to :article
  belongs_to :color
  belongs_to :size

  validates :article_number, presence: true, :numericality => { greater_than: 0 }
end
