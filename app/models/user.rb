# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates_presence_of :first_name, :last_name, :birth_date, :phone_number
  validates :phone_number, length: { in: 6..15 }
  validates_format_of :phone_number, with: /\d[0-9]\)*\z/, message: 'Seul le format 0102030405 est autorisé'

  enum level: { user: 0, influencer: 1 }

  has_many :articles
  has_many :orders
  has_many :payments

  has_one :cart
  has_one :professional

  after_create :generate_cart

  private

  def generate_cart
    Cart.create!(user: self)
  end
end
