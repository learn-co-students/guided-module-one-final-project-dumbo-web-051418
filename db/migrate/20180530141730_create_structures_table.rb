class CreateStructuresTable < ActiveRecord::Migration[5.0]
  def change
    create_table :structures do |t|
      t.string :name
      t.float :toll_amount
    end
  end
end
