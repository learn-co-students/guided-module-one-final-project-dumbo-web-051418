

def screen_splash(ezpass)
  system 'clear'
  <<-HEREDOC
  \t\t\t\t ------------------------
  \t\t\t\t\| EZPass Balance: $#{'%.2f' % ezpass.balance} \|
  \t\t\t\t ------------------------
  \n
  HEREDOC
end

def first_screen(ezpass)
  puts <<-HEREDOC
  #{screen_splash(ezpass)}
  Where would you like to start today?
  HEREDOC
  Location.print_hash
end


def second_screen(ezpass, location)
  puts screen_splash(ezpass)
  #current_area = areas[destination]
  puts "You are now in #{location}"
  puts "Where do you want to drive over?"
  cross_hash = Crossing.print_hash(location)
end

def validate_input(location, user_choice)
  while !location.keys.include?(user_choice)
    puts "Please enter a valid number."
    user_choice = STDIN.gets.chomp.to_i
  end
  return user_choice
end

def validate_input_2(location, user_choice)
  if user_choice != 0
    while !location.keys.include?(user_choice)
      puts "Please enter a valid number."
      user_choice = STDIN.gets.chomp.to_i
    end
  end
  return user_choice
end

def create_transaction(nyc_ezpass, new_location_hash, user_choice)
  transaction = Transaction.create(ez_pass_id: nyc_ezpass.id, crossing_id: new_location_hash[user_choice].id,)
  nyc_ezpass.transactions << transaction
  new_location_hash[user_choice].transactions << transaction
end
