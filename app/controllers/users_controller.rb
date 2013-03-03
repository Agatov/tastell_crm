class UsersController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

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
    redirect_to 'places/login'
  end
end