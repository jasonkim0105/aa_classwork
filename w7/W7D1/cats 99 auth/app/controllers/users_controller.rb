class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      redirect_to users_url
    else
      render :new
    end
  end


  # before_action :require_logged_in, only: [:new, :create]

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
