class SessionsController < ApplicationController
  def create
    @user = User.new
    render :new
  end

  def create

  end
end
