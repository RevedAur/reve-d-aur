# frozen_string_literal: true

class OrderArticle < ApplicationRecord
  belongs_to :article
  belongs_to :order
end
