class PlaceState < ActiveRecord::Base
  attr_accessible :place_id, :state_cd, :state, :user_id, :user

  include Statable

  belongs_to :place
  belongs_to :user
end
