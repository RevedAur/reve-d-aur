# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.string :reference
      t.integer :price, null: false
      t.integer :delivery_price, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
