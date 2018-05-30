class CreateTransactionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      #EZPass and Crossing are inputed throuogh ActiveRecord
    end
  end
end
