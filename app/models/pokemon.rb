class Pokemon < ActiveRecord::Base
  has_many :trainers, through: :pokeballs
  has_many :pokeballs
end
