class CreateSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :sizes, id: :uuid do |t|
      t.integer :name, default: 3, null: false

      t.timestamps
    end
  end
end
