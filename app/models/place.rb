class Place < ActiveRecord::Base
  attr_accessible :address, :city, :contact_name, :name, :phones, :state_cd, :state, :user_id

  belongs_to :user
  has_many :comments

  as_enum :state, [:new, :phoned, :appointment, :not_interested, :met, :to_connect, :success, :rejected], prefix: true
end
