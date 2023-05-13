class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors, id: :uuid do |t|
      t.integer :name, default: 0, null: false

      t.timestamps
    end
  end
end
