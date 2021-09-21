class Api::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(UserParams)

    if @user.save!
      login(@user)
      redirect_to root_url
    else
      flash[:errors] = ['Access Denied, Invalid Credentials']
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
       render json: { error: "There is no user with that id."}, status: 404
    end
  end


  private
  def UserParams
    params.require(:user).permit(:password,:username,:email)
  end

end
