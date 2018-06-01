require_relative '../config/environment'


nyc_ezpass = EZPass.create(balance: 25.0)


location = first_screen(nyc_ezpass)

user_choice = validate_input(location, user_choice) #STDIN.gets.chomp.to_i

location = location[user_choice].name

loop do
  new_location_hash = second_screen(nyc_ezpass, location)

  if new_location_hash.size == 0
    puts "You do not have enough balance to proceed. \n Enjoy #{location}!"
    break
  end
  
  user_choice =  STDIN.gets.chomp.to_i
  user_choice = validate_input_2(new_location_hash, user_choice)
  break if user_choice == 0


  #creates an instance of Transaction class
  create_transaction(nyc_ezpass, new_location_hash, user_choice)

  location = new_location_hash[user_choice].end_location.name
  #debit from pass if crossing has toll
  nyc_ezpass.debit(new_location_hash[user_choice].cost)


end

print_transactions(nyc_ezpass)
