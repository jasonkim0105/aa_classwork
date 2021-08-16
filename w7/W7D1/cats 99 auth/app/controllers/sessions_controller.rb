class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], [:user][:password])

    if @user
      login(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  before_action  :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]


end
