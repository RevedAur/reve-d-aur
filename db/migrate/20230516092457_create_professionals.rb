# frozen_string_literal: true

class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals, id: :uuid do |t|
      t.string :name, null: false
      t.string :siret, null: false

      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
