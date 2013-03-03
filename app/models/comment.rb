class Comment < ActiveRecord::Base
  attr_accessible :content, :place_id, :user_id
end
