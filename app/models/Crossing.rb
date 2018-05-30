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

end
