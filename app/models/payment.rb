# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :user
end
