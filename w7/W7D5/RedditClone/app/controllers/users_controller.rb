class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user
      @user.save
      redirect_to
  end

  def new
    @user = User.new
    render :new
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
