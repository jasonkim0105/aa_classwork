class Api::SessionsController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username], params[:user][:password])
  
    if @user
      login(@user)
      # debugger
      # # redirect_to root_url
      # puts "HELLLOOOO"
      # puts current_user.username
      # puts "BYEEEEEE"
    else
      # render :new
      flash[:errors] = ['Access Denied, Invalid Credentials']
      redirect_to new_api_session_url
    end
  end

  def destroy
    if logout!
    render json: {}
    else
      render json:{"error": "404"}
    end
  end
end
