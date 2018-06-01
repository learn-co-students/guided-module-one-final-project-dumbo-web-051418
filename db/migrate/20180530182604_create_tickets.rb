class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_num
      t.integer :passenger_id
      t.integer :flight_id
    end
  end
end
