class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.text :street_address
      t.string :zip_code
      t.string :city

      # t.string :stripe_payment_id
      t.datetime :purchased_at

      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
