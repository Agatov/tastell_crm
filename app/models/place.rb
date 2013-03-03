class Place < ActiveRecord::Base
  attr_accessible :address, :city, :contact_name, :name, :phones, :state_cd, :user_id
end
