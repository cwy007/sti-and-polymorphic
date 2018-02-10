class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params) # NOTE: cann't be user, must use @member because of render 'new'
    if @member.save
      current_user.move_to(@member) if current_user && current_user.guest?
      session[:user_id] = @member.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def member_params
      params.require(:member).permit(:username, :email, :password, :password_confirmation)
    end
end
