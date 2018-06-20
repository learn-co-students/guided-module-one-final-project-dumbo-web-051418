class Transaction < ActiveRecord::Base
  belongs_to :e_z_pass
  belongs_to :crossing
end
