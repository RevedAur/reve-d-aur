class CreateLegalDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_documents, id: :uuid do |t|
      t.boolean :online, null: false, default: false
      t.datetime :online_at
      t.integer :version, null: false
      t.integer :nature, null: false

      t.timestamps
    end
  end
end
