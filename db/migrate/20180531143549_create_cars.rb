class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :color
      t.string :model
      t.integer :mileage
      t.boolean :used
      t.integer :price
      t.string :brand
      t.string :engine_type
      t.integer :year
    end
  end
end
