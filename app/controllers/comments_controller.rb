class CommentsController < ApplicationController

  before_filter :login_user!

  def index

  end

  def show

  end

  def new

  end

  def create
    @place = Place.find(params[:place_id])
    @comment = current_user.comments.new(params[:comment])

    if @place.add_comment @comment
      redirect_to :back
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end