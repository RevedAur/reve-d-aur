# frozen_string_literal: true

class CreateOrderArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :order_articles, id: :uuid do |t|
      t.belongs_to :article, null: false, foreign_key: true, type: :uuid
      t.belongs_to :order, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
