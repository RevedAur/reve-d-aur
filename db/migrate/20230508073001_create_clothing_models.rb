class CreateClothingModels < ActiveRecord::Migration[7.0]
  def change
    create_table :clothing_models, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
