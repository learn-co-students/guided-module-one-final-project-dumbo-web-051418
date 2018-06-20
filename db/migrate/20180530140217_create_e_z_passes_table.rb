class CreateEZPassesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ezpasses do |t|
      t.float :balance
    end
  end
end
