class SessionsController < ApplicationController
  before_action  :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]
  before_action :require_i_own_this_cat, only: [:edit, :update]
  
  def new
    @user = User.new
    render :new
  end

  def create
    puts "username: #{params[:user][:username]}"
    puts "password: #{params[:user][:password]}"
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    puts "this is beans"
    puts @user.username
    if @user
      login_user!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


end
