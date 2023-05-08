class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :seller_account
end
