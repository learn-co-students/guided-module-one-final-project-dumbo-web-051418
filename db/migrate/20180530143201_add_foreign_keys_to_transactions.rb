class AddForeignKeysToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :e_z_pass_id, :integer
    add_foreign_key :e_z_pass_id

    add_column :transactions, :crossing_id, :integer
    add_foreign_key :crossing_id
  end
end
