class PlacesController < ApplicationController

  def index
    @places = Place.order(:id).includes(:user)
  end

  def show
    @place = Place.find(params[:id])
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

  def destroy

  end

end