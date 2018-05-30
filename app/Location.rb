class Location < ActiveRecord::Base
  has_many :start_crossings, class_name: Crossing, foreign_key: :start_location_id
  has_many :end_crossings :class_name: Crossing, foreign_key: :end_location_id
end
