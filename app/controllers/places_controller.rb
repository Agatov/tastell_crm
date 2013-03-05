class PlacesController < ApplicationController

  before_filter :login_user!
  before_filter :has_access?, except: [:index, :show, :state]

  def index
    if current_user.admin?
      @places = Place.order(:id).includes(:user)
    else
      @places = current_user.places.order(:id)
    end

    @options = {
        show_manager: current_user.can_edit_users?,
        show_edit_link: current_user.can_edit_places?
    }
  end

  def show
    @place = Place.find(params[:id])
    @comments = @place.comments.order('id desc')
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params[:place])

    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update_attributes(params[:place])
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def state
    @place = Place.find(params[:id])
    redirect_to root_path unless current_user.can_change_place_state?(@place)
    @place.update_attributes(state: params[:state])
    redirect_to :back
  end

  def destroy

  end

  private

  def has_access?
    redirect_to root_path unless current_user.can_edit_users?
  end

end