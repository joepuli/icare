class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update]

  def new
    @profile = current_user.build_profile
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
    params.require(:profile).permit(:primary_phone, :secondary_phone,
                                    :family_introduction,
                                    :lifestyle_and_interests,
                                    :experience_with_children,
                                    :support_network,
                                    :available_resources,
                                    parents_attributes: [:id, :first_name,
                                      :middle_name, :last_name,
                                      :date_of_birth, :gender, :religion,
                                      :primary_language, :secondary_language,
                                      :active_or_reserve_duty_military,
                                      :occupation, :relationship_status,
                                      race_ids: []])
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
end
