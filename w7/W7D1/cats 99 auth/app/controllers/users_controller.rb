class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    puts "this is the users_controller"
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to cats_url
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
