# frozen_string_literal: true

class ArticleSize < ApplicationRecord
  belongs_to :article
  belongs_to :size

  before_save :check_available

  validates_uniqueness_of :article, scope: :size,
                                    message: 'La taille existe déjà avec ce vêtement'

  def check_available
    self.available = true if number.positive?
    self.available = false if number.zero?
  end
end
