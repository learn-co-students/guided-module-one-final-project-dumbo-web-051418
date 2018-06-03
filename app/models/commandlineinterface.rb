class CommandLineInterface
  #play song throughout program
  #play diff song in each method
  #play intro with greeting
  #play poke center with menu
  #play theme song with add pokemon

  def greeting # num1 in #run
    message = <<-MESSAGE
    **********************************************************************
    *              "Welcome to Straight Outta Terminal's"                *
    *                      "Module 1 Project"                            *
    *                       "By yours truly"                             *
    *                    "Aisatou, Malorie, Paul"                        *
    **********************************************************************
    MESSAGE
    puts message
     pid = fork{ exec 'afplay', "PokeThemes2.mp3"}
    puts prof_oak
  end

  def prof_oak
    oak = <<-OAK
    #$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$
    $                                                                                    #
    #      Oak:    This world is inhabited by creatures called POKEMON! For some         $
    $              people, POKEMON are pets. Others use them for fights. Myself...       #
    #              I study POKEMON as a profession.                                      $
    $                                                                                    #
    #$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$#$
    OAK
  end

  def verify_username(user_input)
    puts "So you're #{user_input.capitalize}?"
    puts "Y or N"
    user_input = gets.chomp
  end

  def create_new_user(user_input)
    puts "Welcome #{user_input.capitalize}! Where are you from?"
    user_location = gets.chomp
    new_trainer = Trainer.create(name: user_input.capitalize, hometown: user_location.capitalize)
    system("clear")
    puts "That's dope. How's the weather in #{user_location.capitalize}? Are you ready to start your adventure?"
    sleep(0.5)
    new_trainer
  end

  def gauge_visitor(user_input)
    sleep(0.4)
    if returning_trainer = Trainer.find_by(name: user_input.capitalize)
      system("clear")
      puts "Welcome back, #{returning_trainer.name}!"
      # system "say 'Welcome back, #{returning_trainer.name}!'"
      returning_trainer
    else
      user = create_new_user(user_input)
      #can have rival name in table too!
      puts "#{user_input.upcase}! Your very own POKEMON legend is about to unfold! A world of dreams and adventures with POKEMON awaits! Let's go!"
      user
    end
  end

  def get_username
    puts "First, what is your name?" #from what's your nickname
    user_input = gets.chomp.capitalize
    result = verify_username(user_input).upcase
    if result == "Y"
      puts "Right! So your name is #{user_input}!" #from what a lovely name!
      sleep(0.7)
      puts "Menu loading..."
      gauge_visitor(user_input)
    elsif result == "N"
      get_username
    end
  end

  def menu
    the_menu = <<-MENU
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    * "It's unsafe! Wild POKEMON live in tall grass!*
    * You need your own POKEMON for your protection.*
    *        I know! Here, come with me!"           *
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                        *
                        *
                        *
                        *
                        *
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Pick a number to get started! 👻
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    *                                               *
    *            1. View Team                       *
    *            2. Add Pokemon to team             *
    *            3. Set pokemon free                *
    *            4. View Pokestats                  *
    *            5. Exit                            *
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    MENU
  end

  def show_menu(user) # num2 in #run
    puts menu
    user_input = gets.chomp.to_i
    until user_input == 5
      case user_input
      when 1
        view_team(user, "yes")
        break
      when 2
         add_pokemon(user)
        break
      when 3
        set_pokemon_free(user)
        break
      when 4
        view_stats(user)
        break
      else
        puts "Whaddya doing? Try again"
        sleep(1)
        show_menu(user)
        break
      end
    end
  end

  def get_own_team(user, purpose)
    if purpose == "names"                     #for #view_team
      team = user.pokemons.map do |pokemon|
        pokemon.name
      end
      team
    elsif purpose == "team"                    #for #remove method
      team = user.pokemons
    end
  end

  def check_users_pokeballs(user)
    users_team = get_own_team(user, "names")
    system("clear")
    if users_team.size >= 1
      true
    elsif users_team.size <= 0
      false
    end
  end

  def view_team(user, stats)
    user.reload
    if check_users_pokeballs(user)
      team = get_own_team(user, "names")
      system("clear")
      counter = 0
       team.each do |poke|
         puts "#{counter += 1}. #{poke}"
       end
       stats == "yes" ? view_team_stats(user) : nil
     else
       puts "Oh no! You're too weak to have any pokemon. You, #{user.name}, don't have any to view!!"
       sleep(1)
       show_menu(user)
     end
  end

  def stats_table(pokemon)
    stats = <<-STATS
    _____________________________________________________________________
    | Name: #{pokemon.name}
    | Description: #{pokemon.description}
    | Height: #{pokemon.height}
    | Weight: #{pokemon.weight}
    | Type 1: #{pokemon.type_1}
    | Type 2: #{pokemon.type_2}
    | Weakness 1: #{pokemon.weakness_1}
    | Weakness 2: #{pokemon.weakness_2}
    | Catch Rate: #{pokemon.catch_rate}
    | Base HP: #{pokemon.base_hp}
    | Base Attack: #{pokemon.base_attack}
    | Base Defense: #{pokemon.base_defense}
    | Base Sp Attack: #{pokemon.base_sp_attack}
    | Base Sp Defense: #{pokemon.base_sp_defense}
    | Base Speed: #{pokemon.base_speed}
    | Base Exp: #{pokemon.base_experience}
    |____________________________________________________________________
    STATS
    stats
  end

  def view_team_stats(trainer)
    #for specific user's team
    puts "Would you like to see these guys' stats? (Y or N)"
    user_input = gets.chomp
    if user_input.upcase == "Y"
      system("clear")
      puts "Get ready for your dream team's stats!"
      trainer.pokemons.each do |pokemon|
        puts stats_table(pokemon)
      end
    elsif user_input.upcase == "N"
    else
      puts "'Y or N' for Mewtwo's sake!"
    end
    show_menu(trainer)
  end

  def loop_stats(trainer)
    puts "Did you want seek another Pokemon's data? (Y or N)"
    user_input = gets.chomp.upcase
    user_input=="Y" ? view_stats(trainer) : system("clear")
  end

  def find_stats_submenu(trainer)
    puts "Did ya wanna find Poke stats by (1)name, or by (2)pokedex number?"
    sleep(1.4)
    puts "Enter the number, or else we'll release a Gengar in your bedroom."

    user_input = gets.chomp.to_i
    until user_input != 1 || user_input != 2
      puts "For Brock's sake input '1' or '2'!"
      user_input = gets.chomp.to_i
    end

    if user_input == 1
      find_stats_by_name(trainer)
    elsif user_input == 2
      find_stats_by_id
    end
  end

  def find_stats_by_name(trainer)
    puts "Enter this Pokemon's name when you're ready!"
    user_input = gets.chomp.capitalize
    found_pokemon = Pokemon.all.find_by(name: user_input)
    if found_pokemon != nil
      system("clear")
      puts stats_table(found_pokemon)
      loop_stats(trainer)
    else
      system("clear")
      puts "fuhgeddaboudit, there ain't a Pokemon named #{user_input}!"
      sleep(1)
      find_stats_by_name(trainer)
    end
  end

  def find_stats_by_id
    puts "Enter the Pokedex ID now! The faster the better."
    user_input = gets.chomp.to_i
    pokedex_ids = 1..151
    until pokedex_ids.include?(user_input)
      puts "Let me throw some knowledge on you--there are only 151 Pokemon as of today."
      sleep(0.7)
      puts "You are out of usable Pokemon!"
      sleep(0.3)
      puts "You blacked out!"
      sleep(0.2)
      user_input = gets.chomp.to_i
    end
    found_pokemon = Pokemon.all.find(user_input)
    puts stats_table(found_pokemon)
  end

  def view_stats(trainer)
    #for submenu
    puts "Which Pokemon's stats does yee heart desire?"
    sleep(1.3)
    find_stats_submenu(trainer)
    sleep(1)
    puts "Did you wanna continue Prof Oak's research??? (Y/N)"
    user_input = gets.chomp.upcase
    until user_input != "Y" || user_input != "N"
      puts "I SAID 'Y' or 'N'!!!!"
      user_input = gets.chomp.upcase
    end
    if user_input == "Y"
      view_stats(trainer)
    elsif user_input == "N"
      show_menu(trainer)
    end
  end


  def set_pokemon_free(user)
      #takes pokemon off team
      user.reload
    if check_users_pokeballs(user)
      users_team = view_team(user, "no")  #no refers to don't show team's pokemon's stats
      puts "Which Pokemon do you wanna remove, playa?"
      delete_pokemon(user, users_team)
    else
      system("clear")
      puts "Oh no! You're too weak to have any pokemon. You, #{user.name}, don't have any to release!!"
      sleep(1)
    end
    show_menu(user)
   end

   def db_remove_pokemon(user, pokemon)
     puts "You DEADASS tryna delete #{pokemon.name}???? (Y or N)"
     # system("say 'You DEADASS tryna delete #{delete_pokemon.name}????'")
     user_input = gets.chomp.upcase
     if user_input == "Y"
       deleted_pokemon = nil
       user.pokeballs.each do |pokeball|
         if pokeball.pokemon_id == pokemon.id && pokeball.trainer_id == user.id
           deleted_pokemon = user.pokeballs.delete(pokeball.id)
         end
       end
       system("clear")
       deleted_pokemon_name = Pokemon.all.find(deleted_pokemon.first.pokemon_id).name
       puts "Poor #{deleted_pokemon_name}... I mean, you must've had your own reasons..."
       puts "AKA--you successfully set #{deleted_pokemon_name} free you evil son of a Rocket!"
       sleep(1)
     elsif user_input == "N"
       show_menu(user)
     else
       puts "Uhh, #{user}--I think you got a typo.."
       db_remove_pokemon(user, pokemon)
     end
   end

   def delete_pokemon(user, users_team)
     # what happens if they say yes
     puts users_team
     raw_team = get_own_team(user, "team")
     user_input = gets.chomp.to_i

     if user_input > 0 && user_input <= raw_team.length
       pokemon = raw_team[(user_input-1)]
       db_remove_pokemon(user, pokemon)
     else
       puts "Getting nervous? Second guesses? Cause, you've got a typo or something. #{user.name}, try again with the list number!"
       sleep(4)
       set_pokemon_free(user)
     end
   end

  def check_team_length(user)
    team = user.pokemons.reload.map do |pokemon|
      pokemon.name
    end
  end

  def list_all_pokemon
    counter = 0
    puts "Here's a list to choose from:"
    all_pokemon = Pokemon.all.map do |pokemon|
      puts "#{counter += 1}. #{pokemon.name}"
    end
   end

   def add_pokemon_to_team(user, user_response)
     if Pokemon.find_by(name: user_response) == nil
       puts "Whatchu talmbout?"
       add_pokemon(user)
     else
       pokemon = Pokemon.find_by(name: user_response)
       add_pokemon = Pokeball.create(pokemon_id: pokemon.id, trainer_id: user.id)
       system("clear")
       puts "You have a brand spanking new #{pokemon.name}!"
     end
   end

   def want_another_pokemon(user)
     puts "Want another pokemon? (Y or N)"
     user_response = poke_prompt
     if user_response == "Y"
       add_pokemon(user)
     else
       show_menu(user)
     end
   end

   def poke_prompt
     gets.chomp.capitalize
   end

  def add_pokemon(user)
    puts "Who do you want on your dream team? (Type Pokemon's name or IDK)"
    user_input = poke_prompt

    if check_team_length(user).length >= 6
      puts "Your party is full!"
      show_menu(user)
    elsif user_input.downcase == "idk"
      list_all_pokemon
      add_pokemon(user)
    elsif user.pokeballs.length < 6
      add_pokemon_to_team(user, user_input)
      want_another_pokemon(user)
    end
  end

  def run
    greeting
    show_menu(get_username)
    pid = fork{ exec 'killall', "afplay" }
  end

end
#binding.pry
