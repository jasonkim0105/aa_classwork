class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user
      @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permits(:username, :password)
  end
end
