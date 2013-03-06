class Event < ActiveRecord::Base
  attr_accessible :comment_id, :comment, :place_id, :place, :place_state_id, :place_state, :type_cd, :type, :user_id, :user

  belongs_to :place
  belongs_to :user
  belongs_to :place_state
  belongs_to :comment

  as_enum :type, [:state_changed, :comment_added]
end
