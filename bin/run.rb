require_relative '../config/environment'


nyc_ezpass = EZPass.new(balance: 25.0)


location = first_screen(nyc_ezpass)
user_choice = STDIN.gets.chomp.to_i

location = location[user_choice].name


loop do
  new_location_hash = second_screen(nyc_ezpass, location)

  user_choice = (STDIN.gets.chomp.to_i)
  break if user_choice == 0
  location = new_location_hash[user_choice].end_location.name
  nyc_ezpass.debit(new_location_hash[user_choice].cost)

end
  
