class User < ActiveRecord::Base
  attr_accessible :avatar, :first_name, :last_name, :login, :password, :role_cd, :role

  has_many :places
  has_many :comments
  has_many :events
  has_many :place_states

  as_enum :role, [:manager, :moderator, :admin]

  include UserConcerns::Permissions

  # @param [String] password
  def can_authenticate?(password)
    self.password == password
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end
end
