class UpdateColumnEzpassTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :e_z_pass_id, :ez_pass_id
  end
end
