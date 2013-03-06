module Builders
  class EventBuilder
    def build_state_changed(options = {})
      user = options[:user]

      user.events.build(
          type: :state_changed,
          place_state: options[:place_state],
          place: options[:place]
      )
    end

    def build_comment_added(options = {})
      user = options[:user]

      user.events.build(
          type: :comment_added,
          comment: options[:comment],
          place: options[:place]
      )
    end
  end
end