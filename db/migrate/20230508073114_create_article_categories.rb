class CreateArticleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :article_categories, id: :uuid do |t|
      t.belongs_to :article, null: false, foreign_key: true, type: :uuid
      t.belongs_to :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
