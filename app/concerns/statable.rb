module Statable
  extend ActiveSupport::Concern

  included do
    as_enum :state, [:new, :phoned, :appointment, :not_interested, :met, :to_connect, :success, :rejected], prefix: true
    scope :with_state, lambda { |state| where(state_cd: self.states(state)) unless state.nil? }
  end
end