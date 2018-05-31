class Crossing < ActiveRecord::Base
  belongs_to :start_location, class_name: Location
  belongs_to :end_location, class_name: Location
  belongs_to :structure

  def cost
    has_toll ? self.structure.toll_amount : 0.0
  end

  def self.cross_between(area1, area2)
    Crossing.find_by(start_location: Location.find_by(name: "#{area1}"), end_location: Location.find_by(name: "#{area2}"))
  end

  def self.crossings_by_location(name)
    self.all.select {|c| c.start_location_id == Location.id_number(name)}
  end

  def self.make_hash(current_area)
    map_hash = Hash.new
    Crossing.crossings_by_location(current_area).each_with_index do |crossing, index|
      map_hash[index+1] = crossing
    end
    map_hash
  end

  def self.print_hash(current_area)
    print_this = make_hash(current_area)
    print_this.each do |key, crossing|
      puts "(#{key})\t#{crossing.structure.name} -- To #{crossing.end_location.name}"
    end
    
  end
end
