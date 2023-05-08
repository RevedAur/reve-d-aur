# frozen_string_literal: true

class Article < ApplicationRecord
  has_rich_text :description
  has_many_attached :images

  has_many :article_categories, class_name: "ArticleCategory"
  has_many :categories, through: :article_categories, class_name: "Category"

  has_many :order_article
  has_many :order, through: :order_article

  enum status: {
    draft: 0,
    online: 1,
    deleted: 2,
  }

  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_categories, ->(category) { joins(:categories).where(categories: { name: category }) }
end
