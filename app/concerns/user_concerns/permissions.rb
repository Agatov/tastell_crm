module UserConcerns
  module Permissions
    extend ActiveSupport::Concern

    def can_edit_users?
      admin?
    end

    def can_edit_places?
      admin?
    end

    def can_add_places?
      admin?
    end

    def can_change_place_state?(place)
      admin? or place.user_id == self.id
    end

    def can_view_place?(place)
      admin? or place.user_id == self.id
    end
  end
end