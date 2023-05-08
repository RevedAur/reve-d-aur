class CartArticle < ApplicationRecord
  belongs_to :cart
  belongs_to :article
end
