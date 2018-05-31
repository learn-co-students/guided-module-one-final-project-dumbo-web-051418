class Car < ActiveRecord::Base
  has_many :purchases
  has_many :cars, through: :purchases

  def self.find_by_name(name)
    # self.all.select{|car| car.brand == name}
    Car.where(brand:name)
  end

  
end
