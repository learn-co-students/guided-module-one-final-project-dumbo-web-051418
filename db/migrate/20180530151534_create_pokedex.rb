class CreatePokedex < ActiveRecord::Migration[5.0]
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.string :description
      t.float :height
      t.float :weight
      t.integer :type_1
      t.integer :type_2
      t.string :weakness_1
      t.string :weakness_2
      t.integer :catch_rate
      t.integer :base_hp
      t.integer :base_attack
      t.integer :base_defense
      t.integer :base_sp_attack
      t.integer :base_sp_defense
      t.integer :base_speed
      t.integer :base_experience
    end
  end
end
