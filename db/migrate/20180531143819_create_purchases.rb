class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :car_id
      t.integer :buyer_id
      t.string :date
    end
  end
end
