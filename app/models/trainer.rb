class Trainer < ActiveRecord::Base
  has_many :pokemons, through: :pokeballs
  has_many :pokeballs
end
