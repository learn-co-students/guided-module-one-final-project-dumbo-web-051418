  class Passenger < ActiveRecord::Base
    has_many :tickets
    has_many :flights, through: :tickets

    def pretty_print
      puts "|---------------------------------------|"
      puts "| First Name    | #{self.first_name.capitalize}"
      puts "|---------------------------------------|"
      puts "| Last Name     | #{self.last_name.capitalize}"
      puts "|---------------------------------------|"
      puts "| Passport Num  | #{self.passport_num}"
      puts "|---------------------------------------|"
      puts ""
    end

    def self.find_by_passport_num(num)
      self.find_by(passport_num: num)
    end

  end
