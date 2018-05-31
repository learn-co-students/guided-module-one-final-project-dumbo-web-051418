class Location < ActiveRecord::Base
  has_many :start_crossings, class_name: Crossing, foreign_key: :start_location_id
  has_many :end_crossings, class_name: Crossing, foreign_key: :end_location_id

  def self.id_number(name)
    self.find_by(name: name).id
  end

  def self.make_hash
    map_hash = Hash.new
    Location.all.each_with_index do |location, index|
      map_hash[index+1] = location
    end
    map_hash
  end

  def self.print_hash
    print_this = self.make_hash
    print_this.each do |key, location|
      puts "(#{key})\t#{location.name}"
    end
  end
end
