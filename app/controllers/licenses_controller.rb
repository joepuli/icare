class LicensesController < ApplicationController
  before_action :find_profile, :find_license

  def edit
    @license = @profile.license? ? @profile.license : @profile.build_license
  end

  def update
    if @profile.update_attributes(profile_attributes)
      redirect_to [@profile, @license]
    else
      render :edit
    end
  end

  private

  def profile_attributes
    params.require(:profile).permit(license_attributes: [:training_classes,
                                                         :been_a_foster_parent,
                                                         :current_license,
                                                         :completed_on,
                                                         :updated_on])
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_license
    @license = @profile.license
  end
end
