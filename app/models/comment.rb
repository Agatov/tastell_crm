class Comment < ActiveRecord::Base
  attr_accessible :content, :place_id, :user_id

  has_one :event

  belongs_to :user
  belongs_to :place
end
