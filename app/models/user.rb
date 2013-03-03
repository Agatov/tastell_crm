class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name, :login, :password, :role_cd

  # @param [String] password
  def can_authenticate?(password)
    self.password == password
  end
end
