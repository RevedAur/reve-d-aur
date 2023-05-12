# frozen_string_literal: true

class Article < ApplicationRecord
  has_rich_text :description

  has_many_attached :images  do |attachable|
    attachable.variant :thumb, resize: "100x100"
    attachable.variant :medium, resize: "300x300", monochrome: true
  end

  has_many :article_categories, class_name: "ArticleCategory"
  has_many :categories, through: :article_categories, class_name: "Category"

  has_many :order_article
  has_many :order, through: :order_article

  enum status: {
    draft: 0,
    online: 1,
    deleted: 2,
  }

  def self.translate_status_key
    statuses.keys.map do |key| I18n.t("article.activerecord.attributes.#{key}") end
  end

  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_categories, ->(category) { joins(:categories).where(categories: { name: category }) }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
