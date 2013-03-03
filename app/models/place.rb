class Place < ActiveRecord::Base
  attr_accessible :address, :city, :contact_name, :name, :phones, :state_cd, :state, :user_id

  belongs_to :user

  as_enum :state, [:new, :success, :rejected]
end
