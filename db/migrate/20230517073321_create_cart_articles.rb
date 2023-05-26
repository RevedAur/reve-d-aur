# frozen_string_literal: true

class CreateCartArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_articles, id: :uuid do |t|
      t.integer :article_number, default: 1, null: false

      t.belongs_to :cart, null: false, foreign_key: true, type: :uuid
      t.belongs_to :article, null: false, foreign_key: true, type: :uuid
      t.belongs_to :color, null: false, foreign_key: true, type: :uuid
      t.belongs_to :size, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
