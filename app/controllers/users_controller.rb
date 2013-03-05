class UsersController < ApplicationController

  before_filter :login_user!, except: [:login, :login_page]
  before_filter :has_access?, except: [:login, :login_page, :logout]


  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @places = @user.places
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
  end

  def login_page
    render layout: 'login_page'
  end

  def login
    @user = User.find_by_login(params[:login])

    if @user.can_authenticate?(params[:password])
      sign_in @user
      redirect_to places_path
    else
      render :login_page
    end
  end

  def logout
    sign_out
    redirect_to login_users_path
  end

  private

  def has_access?
    redirect_to root_path unless current_user.can_edit_users?
  end
end