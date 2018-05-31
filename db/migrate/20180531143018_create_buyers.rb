class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.integer :age
      t.integer :credit_score
      t.boolean :insurance
      t.boolean :divers_license
    end
  end
end
