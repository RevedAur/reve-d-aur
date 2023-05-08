class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum level: { user: 0, admin: 1 }

  has_many :articles
  has_many :orders
  has_many :payments

  has_one :cart

  after_create :generate_cart

  private

  def generate_cart
    Cart.create!(user: self)
  end
end
