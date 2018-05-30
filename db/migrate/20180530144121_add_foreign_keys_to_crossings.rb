class AddForeignKeysToCrossings < ActiveRecord::Migration[5.0]
  def change
    add_column :crossings, :start_location_id, :integer
    add_foreign_key :start_location_id

    add_column :crossings, :end_location_id, :integer
    add_foreign_key :end_location_id

    add_column :crossings, :structure_id, :integer
    add_foreign_key :structure_id
  end
end
