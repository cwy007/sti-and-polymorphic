class MemberProfilesController < ApplicationController
  def new
    @member_profile = MemberProfile.new
  end

  def create
    @member_profile = MemberProfile.new(member_profile_params) # NOTE: cann't be user, must use @member_profile because of render 'new'
    if @member_profile.save
      if current_user
        current_user.become_member(@member_profile)
      else
        session[:user_id] = @member_profile.create_user.id
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def member_profile_params
      params.require(:member_profile).permit(:username, :email, :password, :password_confirmation)
    end
end
