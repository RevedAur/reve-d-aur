class CreateLegalDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_documents do |t|
      t.string :content
      t.boolean :online, null: false, default: false
      t.datetime :online_at
      t.integer :version, null: false
      t.integer :nature, null: false

      t.timestamps
    end
  end
end
