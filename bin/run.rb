require_relative '../config/environment'


nyc_ezpass = EZPass.create(balance: 25.0)


location = first_screen(nyc_ezpass)

user_choice = validate_input(location, user_choice) #STDIN.gets.chomp.to_i

location = location[user_choice].name

loop do
  new_location_hash = second_screen(nyc_ezpass, location)

  user_choice =  STDIN.gets.chomp.to_i
  user_choice = validate_input_2(new_location_hash, user_choice)
  break if user_choice == 0


  #creates an instance of Transaction class
  create_transaction(nyc_ezpass, new_location_hash, user_choice)

  location = new_location_hash[user_choice].end_location.name

  if nyc_ezpass.attempt_debit(new_location_hash[user_choice].cost)
    nyc_ezpass.debit(new_location_hash[user_choice].cost)
  else
    puts "You don't have enough for this transaction. \nEnjoy #{new_location_hash[user_choice].start_location.name}."
    break
  end

end
