# frozen_string_literal: true

class ArticleColor < ApplicationRecord
  belongs_to :color
  belongs_to :article

  validates_uniqueness_of :color, scope: :article,
                                  message: 'Cette couleur a déjà été associé à ce vêtement'
end
