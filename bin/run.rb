require_relative '../config/environment'

# puts "Hello! May we have your name?"
# name = STDIN.gets.chomp

nyc_ezpass = EZPass.new(balance: 25.0)


puts first_screen(nyc_ezpass)
destination = STDIN.gets.chomp.to_i
#
possible_destination = second_screen(nyc_ezpass, destination)

destination2 = (STDIN.gets.chomp.to_i)-1
possible_destination[destination2]


nyc_ezpass.debit(possible_destination[destination2].cost)


binding.pry
