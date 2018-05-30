class ChangeEZPassToEzPass < ActiveRecord::Migration[5.0]
  def change
    drop_table :ezpasses

    create_table :ez_passes do |t|
      t.float :balance
    end
  end
end
