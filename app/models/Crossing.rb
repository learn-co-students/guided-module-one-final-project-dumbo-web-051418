class Crossing < ActiveRecord::Base
  belongs_to :start_location, class_name: Location
  belongs_to :end_location, class_name: Location
  belongs_to :structure
  has_many :transactions

  def cost
    has_toll ? self.structure.toll_amount : 0.0
  end

  def self.cross_between(area1, area2)
    Crossing.find_by(start_location: Location.find_by(name: "#{area1}"), end_location: Location.find_by(name: "#{area2}"))
  end

  def self.crossings_by_location(name)
    self.all.select {|c| c.start_location_id == Location.id_number(name)}
  end

  def self.make_hash(current_area, ezpass)
    map_hash = Hash.new
    Crossing.crossings_by_location(current_area).each_with_index do |crossing, index|
      if ezpass.attempt_debit(crossing.cost)
        map_hash[index+1] = crossing
      end
    end
    map_hash
  end

  def self.print_hash(current_area, ezpass)
    print_this = make_hash(current_area, ezpass)
    print_this.each do |key, crossing|
      puts "(#{key})\t#{crossing.structure.name} -- To #{crossing.end_location.name}"
    end

  end
end
