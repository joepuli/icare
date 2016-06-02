class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update]
  def new
    @profile = current_user.build_profile
    @profile.trainings.build
    @profile.courses.build
    @profile.preferences.build
    @profile.build_address
  end

  def create
    @profile = current_user.build_profile(profile_attributes)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def show
  end

  def edit
    @profile.trainings.build
    @profile.courses.build
    @profile.preferences.build
    @profile.build_address if @profile.address.blank?
  end

  def update
    if @profile.update_attributes(profile_attributes)
      redirect_to @profile
    else
      render :edit
    end
  end

  private

  def profile_attributes
    params.require(:profile).permit(:first_name, :middle_name,
                                    :last_name, :born_on,
                                    trainings_attributes: [:id, :name],
                                    courses_attributes: [:id, :name],
                                    preferences_attributes: [:id, :name],
                                    address_attributes: [:address_1, :address_2,
                                                         :city, :state, :zip,
                                                         :id]
                                  )
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
