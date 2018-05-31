class Purchase < ActiveRecord::Base
  belongs_to :car
  belongs_to :buyer
end
