require 'pry'
class CommandLineInterface
  def greet
      banner2 = <<-EOF
        db   d8b   db d88888b db       .o88b.  .d88b.  .88b  d88. d88888b      d888888b  .d88b.
        88   I8I   88 88'     88      d8P  Y8 .8P  Y8. 88'YbdP`88 88'          `~~88~~' .8P  Y8.
        88   I8I   88 88ooooo 88      8P      88    88 88  88  88 88ooooo         88    88    88
        Y8   I8I   88 88~~~~~ 88      8b      88    88 88  88  88 88~~~~~         88    88    88
        `8b d8'8b d8' 88.     88booo. Y8b  d8 `8b  d8' 88  88  88 88.             88    `8b  d8'
         `8b8' `8d8'  Y88888P Y88888P  `Y88P'  `Y88P'  YP  YP  YP Y88888P         YP     `Y88P'


        d88888b db      d888888b  d888b  db   db d888888b      d8888b.  .d88b.   .d88b.  db   dD d88888b d8888b.
        88'     88        `88'   88' Y8b 88   88 `~~88~~'      88  `8D .8P  Y8. .8P  Y8. 88 ,8P' 88'     88  `8D
        88ooo   88         88    88      88ooo88    88         88oooY' 88    88 88    88 88,8P   88ooooo 88oobY'
        88~~~   88         88    88  ooo 88~~~88    88         88~~~b. 88    88 88    88 88`8b   88~~~~~ 88`8b
        88      88booo.   .88.   88. ~8~ 88   88    88         88   8D `8b  d8' `8b  d8' 88 `88. 88.     88 `88.
        YP      Y88888P Y888888P  Y888P  YP   YP    YP         Y8888P'  `Y88P'   `Y88P'  YP   YD Y88888P 88   YD
      EOF
    puts banner2
  end

  def menu
    puts ""
    puts "Menu Option"
    puts "1. Show All Flights"
    puts "2. Book a Flight"
    puts "3. Show All My Flights"
    puts "4. Show All Passenger Info"
    puts "5. Cancel a Flight"
    puts "6. Print My Ticket"
    puts "7. Exit "
    puts ""
    puts "Enter an Option Number (1-7)"
  end

  #return all flights
  def show_all_flights
    show_flights(Flight.all)
  end

  def show_all_passenger
    show_all_passenger_info(Passenger.all)
  end

  # Creates a Ticket object
  def book_a_flight(user)
    puts "Please enter a Flight Number"
    input = get_input.to_i
    if input == 1
      puts ""
      puts "Sorry, this flight is only available to Elon Musk and only after we all get our Model 3's."
      puts "Also, we do not have the capability to go to Mars...yet..."
      puts ""
      return
    end
    return puts "Invalid flight number, please try again" if find_flight_by_flight_num(input) == nil
    flight_id = find_flight_by_flight_num(input)
    Ticket.create(ticket_num: random_number_generator, passenger_id: user.id, flight_id: flight_id)
    puts "Your flight has been booked, remember to print your ticket"
  end

  def cancel_a_flight(user)
    show_all_passengers_flights(user)
    puts "Select flight number you would like to cancel"
    flight_num = get_input.to_i
    flight_id_num = find_flight_by_flight_num(flight_num)
    ticket = Ticket.find_by(flight_id: flight_id_num)
    ticket.id
    Ticket.destroy(ticket.id)
    puts "Your flight #{flight_num} has been cancelled"
  end

  def show_all_passengers_flights(user)
    show_flights(user.flights)
  end


  def run
    system("clear")
    greet
    user = login_kinda
    menu
    input = get_input
    until input.to_i == 7
      option(input, user.reload)
      menu
      input = get_input
    end
    system("clear")
    exit
  end

  def option(input, user)
    if input.downcase == "WE GOT OUR MODEL 3s!!!".downcase
      musk_method
    end

    case input.to_i
    when 1
      puts "Available Flights"
      show_all_flights
    when 2
      puts "Booking Flight"
      book_a_flight(user)
    when 3
      show_all_passengers_flights(user)
    when 4
      puts "All Passengers Information"
      show_all_passenger
    when 5
      puts "Cancel a Flight"
      cancel_a_flight(user)
    when 6
      puts "Print a Ticket"
      show_all_passengers_flights(user)
      puts "Please enter your flight number"
      flight_num = get_input
      find_ticket(user).print_ticket
    when 7
    else
      puts "Please enter one of the avaliable options"
    end
  end

# Helper methods
  # takes a flight num as an argument and return the flight id
  def find_flight_by_flight_num(flight_num)
    if !Flight.find_by(flight_number: flight_num)
      return nil
    else
      flight = Flight.find_by(flight_number: flight_num)
      flight.id
    end
  end

  def find_ticket(user)
    Ticket.find_by(passenger_id: user.id)
  end

  def create_passenger
    new_passenger = get_passenger_info
    Passenger.create(first_name: new_passenger[0].capitalize, last_name: new_passenger[1].capitalize, passport_num: new_passenger.last )
  end

  def show_flights(flights)
   flights.each do |flight|
     puts "|---------------------------------------|"
     puts "| Airline     | #{flight.name}"
     puts "|---------------------------------------|"
     puts "| Depart Time | #{flight.departure_time}"
     puts "|---------------------------------------|"
     puts "| Departure   | #{flight.start_location}"
     puts "|---------------------------------------|"
     puts "| Destination | #{flight.end_location}"
     puts "|---------------------------------------|"
     puts "| Flight Num. | #{flight.flight_number}"
     puts "|---------------------------------------|"
     puts ""
   end
 end

 def show_all_passenger_info(passengers)
   passengers.each do |passenger|
     passenger.pretty_print
   end
 end

  def get_passenger_info
    info = []
    puts "Please enter your First Name:"
    info << get_input
    puts "Please enter your Last Name:"
    info << get_input
    puts "Please enter your Passport Number:"
    info << get_input.to_i
  end

  def get_input
    gets.chomp.downcase
  end

  def login_kinda
    puts "Are you a New User? (Y or N)"
    response = get_input
    if response == "y"
      user = create_passenger
    else
      puts "Please enter your Passport Number:"
      user = Passenger.find_by(passport_num: get_input)
    end
  end

  def random_number_generator
    1 + rand(10000 + 1)
  end

  def musk_method
    mars_flight = Flight.find_or_create_by(name: "SpaceX", departure_time: "ASAP", seat: "1", meal: true, zone: "Not that kind of flight",
                 start_location: "Cape Canaveral, FL", end_location: "Mars", flight_number: 1)

    elon = Passenger.find_or_create_by(first_name: "Elon", last_name: "Musk", passport_num: 1)

    Ticket.create(ticket_num: random_number_generator, passenger_id: elon.id, flight_id: mars_flight.id).print_ticket
  end

  def exit
    banner = <<-EOF
      d888888b db   db  .d8b.  d8b   db db   dD      db    db  .d88b.  db    db      d88888b  .d88b.  d8888b.      db    db .d8888. d888888b d8b   db  d888b
      `~~88~~' 88   88 d8' `8b 888o  88 88 ,8P'      `8b  d8' .8P  Y8. 88    88      88'     .8P  Y8. 88  `8D      88    88 88'  YP   `88'   888o  88 88' Y8b
         88    88ooo88 88ooo88 88V8o 88 88,8P         `8bd8'  88    88 88    88      88ooo   88    88 88oobY'      88    88 `8bo.      88    88V8o 88 88
         88    88~~~88 88~~~88 88 V8o88 88`8b           88    88    88 88    88      88~~~   88    88 88`8b        88    88   `Y8b.    88    88 V8o88 88  ooo
         88    88   88 88   88 88  V888 88 `88.         88    `8b  d8' 88b  d88      88      `8b  d8' 88 `88.      88b  d88 db   8D   .88.   88  V888 88. ~8~
         YP    YP   YP YP   YP VP   V8P YP   YD         YP     `Y88P'  ~Y8888P'      YP       `Y88P'  88   YD      ~Y8888P' `8888Y' Y888888P VP   V8P  Y888P


        d88888b db      d888888b  d888b  db   db d888888b      d8888b.  .d88b.   .d88b.  db   dD d88888b d8888b.
        88'     88        `88'   88' Y8b 88   88 `~~88~~'      88  `8D .8P  Y8. .8P  Y8. 88 ,8P' 88'     88  `8D
        88ooo   88         88    88      88ooo88    88         88oooY' 88    88 88    88 88,8P   88ooooo 88oobY'
        88~~~   88         88    88  ooo 88~~~88    88         88~~~b. 88    88 88    88 88`8b   88~~~~~ 88`8b
        88      88booo.   .88.   88. ~8~ 88   88    88         88   8D `8b  d8' `8b  d8' 88 `88. 88.     88 `88.
        YP      Y88888P Y888888P  Y888P  YP   YP    YP         Y8888P'  `Y88P'   `Y88P'  YP   YD Y88888P 88   YD


        db   db  .d8b.  db    db d88888b       .d8b.        d888b  d8888b. d88888b  .d8b.  d888888b      d888888b d8888b. d888888b d8888b. db
        88   88 d8' `8b 88    88 88'          d8' `8b      88' Y8b 88  `8D 88'     d8' `8b `~~88~~'      `~~88~~' 88  `8D   `88'   88  `8D 88
        88ooo88 88ooo88 Y8    8P 88ooooo      88ooo88      88      88oobY' 88ooooo 88ooo88    88            88    88oobY'    88    88oodD' YP
        88~~~88 88~~~88 `8b  d8' 88~~~~~      88~~~88      88  ooo 88`8b   88~~~~~ 88~~~88    88            88    88`8b      88    88~~~
        88   88 88   88  `8bd8'  88.          88   88      88. ~8~ 88 `88. 88.     88   88    88            88    88 `88.   .88.   88      db
        YP   YP YP   YP    YP    Y88888P      YP   YP       Y888P  88   YD Y88888P YP   YP    YP            YP    88   YD Y888888P 88      YP
    EOF
        puts banner
  end

end
