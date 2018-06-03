class CreatePokeball < ActiveRecord::Migration[5.0]
  def change
    create_table :pokeballs do |t|
      t.integer :pokemon_id
      t.integer :trainer_id
    end
  end
end
