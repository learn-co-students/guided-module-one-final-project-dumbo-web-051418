class Ticket < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :flight

  def print_ticket
    puts "|---------------------------------------|"
    puts "|       #{self.flight.name}"
    puts "|---------------------------------------|"
    puts "| Name        | #{self.passenger.first_name.capitalize} #{self.passenger.last_name.capitalize}"
    puts "|---------------------------------------|"
    puts "| Depart Time | #{self.flight.departure_time}"
    puts "|---------------------------------------|"
    puts "| Class       | #{self.flight.zone}"
    puts "|---------------------------------------|"
    puts "| From        | #{self.flight.start_location}"
    puts "|---------------------------------------|"
    puts "| To          | #{self.flight.end_location}"
    puts "|---------------------------------------|"
    puts "| Flight Num. | #{self.flight.flight_number}"
    puts "|---------------------------------------|"
    puts "| Meal        | #{self.flight.meal}"
    puts "|---------------------------------------|"
    puts "| Seat        | #{self.flight.seat}"
    puts "|---------------------------------------|"
    puts ""
  end
end
