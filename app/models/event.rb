class Event < ActiveRecord::Base
  attr_accessible :comment_id, :place_id, :place_state_id, :type_cd, :user_id
end
