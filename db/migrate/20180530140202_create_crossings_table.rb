class CreateCrossingsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :crossings do |t|
      t.string :name
      t.boolean :has_toll?
    end
  end
end
