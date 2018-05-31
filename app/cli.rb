class CLI
  def greet
    puts 'Welcome to the JAM Dealership!'
  end

  def buy_car?
    puts "do you want to buy a car? (yes/no)"
    possible_buyer=gets.chomp
    if possible_buyer == "yes"
      puts "What is your name?"
      name = gets.chomp
      Buyer.create(name:name)
    else
      puts "Sorry Buyers only in this section"
    end
  end

  def buyer_car_search
    puts "What kind of car do you have in mind?"
    name = gets.chomp
    p Car.find_by_name(name)
  end








end
