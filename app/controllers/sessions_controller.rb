class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by_username(params[:member][:username])
    if member && member.authenticate(params[:member][:password])
      session[:user_id] = member.id
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
