class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'logged in!'
    else
      flash.now.alert = "Name or password is invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: 'logged out!'
  end
end
