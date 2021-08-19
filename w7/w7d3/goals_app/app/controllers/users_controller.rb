class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      # render json: "user saved"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
      # render json: "user did not save"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password) # permit all cols
  end


end
