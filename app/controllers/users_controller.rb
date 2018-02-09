class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)   # NOTE: cann't be user, must use @user because of render 'new'
    if @user.save
      session[:user_id] = user.id
      flash[:notice] = 'signup successfully!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
