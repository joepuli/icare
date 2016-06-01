class Ujs::PreferencesController < ApplicationController
  before_action :find_profile, :find_preference
  respond_to :html, :js

  def edit
  end

  def update
    if @preference.update_attributes(preference_attributes)
      respond_with(@preference, location: @profile)
    end
  end

  def destroy
    respond_with(@preference, location: @profile) if @preference.destroy
  end

  private

  def preference_attributes
    params.require(:preference).permit(:name)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_preference
    @preference = @profile.preferences.find(params[:id])
  end
end
