require 'faker'

Car.destroy_all

brand = ["chevy", "toyota","lexus","mclaren","tesla","porshce","honda","Range Rover"]

10.times do |index|
  # Car.create(brand: Faker::Vehicle.manufacturer)
  Car.create(brand: brand.sample, color: Faker::)

end

p "created #{Car.count}"
