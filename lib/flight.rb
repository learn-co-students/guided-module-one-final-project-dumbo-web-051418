class Flight < ActiveRecord::Base
  has_many :tickets
  has_many :passengers, through: :tickets


  def pretty
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
