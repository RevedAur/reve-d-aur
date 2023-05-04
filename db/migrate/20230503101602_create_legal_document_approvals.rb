class CreateLegalDocumentApprovals < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_document_approvals do |t|
      t.datetime :approved_at, null: false, default: DateTime.now

      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :legal_document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
