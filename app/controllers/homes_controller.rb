class HomesController < ApplicationController
  before_action :find_profile, :find_home

  def index
    @parents = @profile.parents
  end

  def edit
    @home = @profile.home? ? @profile.home : @profile.build_home
  end

  def update
    if @profile.update_attributes(profile_attributes)
      redirect_to [@profile, @home]
    else
      render :edit
    end
  end

  private

  def profile_attributes
    params.require(:profile).permit(home_attributes: [:id, :can_family_pay_for_preplacement_visits,
                                    :address_type,
                                    :can_family_travel_for_preplacement_visits,
                                    :is_your_home_wheelchair_accessible,
                                    :pets_in_the_home,
                                    address_attributes: [:home_address, :city,
                                                         :address_2, :state,
                                                         :zip]])
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_home
    @home = @profile.home
  end
end
