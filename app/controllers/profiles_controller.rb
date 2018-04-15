class ProfilesController < ApplicationController
  def new
    @profile = Profile.new(user: current_user)
  end

  def create
    @profile = Profile.create profile_params
    if @profile.save
      flash[:success] = "Successfully created your profile"
      redirect_to jobs_path
    else
      flash[:error] = "Unable to create profile"
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :company_name, :street_address, :city, :state, :zip)
  end
end
