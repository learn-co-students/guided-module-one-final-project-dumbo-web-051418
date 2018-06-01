class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :departure_time
      t.string :seat
      t.boolean :meal
      t.string :zone
      t.string :start_location
      t.string :end_location
      t.integer :flight_number
    end
  end
end
