class CreateTransactionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :e_z_pass_id
      t.integer :crossing_id
      t.timestamps

      #EZPass and Crossing are inputed throuogh ActiveRecord
    end
  end
end
