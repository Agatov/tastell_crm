class EventsController < ApplicationController
  def index
    @events = Event.order('id desc')
        .for_user(params[:user_id])
        .includes(:user)
        .includes(:place)
        .includes(:comment).includes(:place_state)
  end
end