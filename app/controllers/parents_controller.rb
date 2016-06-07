class ParentsController < ApplicationController
  before_action :find_profile

  def index
    @parents = @profile.parents
  end

  def edit
    @parent = @profile.parents? ? @profile.parents.first : @profile.parents.build
  end

  def update
    if @profile.update_attributes(profile_attributes)
      redirect_to [@profile, :parents]
    else
      render :edit
    end
  end

  private

  def profile_attributes
    params.require(:profile).permit(parents_attributes: [:id, :first_name,
                                      :middle_name, :last_name,
                                      :date_of_birth, :gender, :religion,
                                      :primary_language, :secondary_language,
                                      :active_or_reserve_duty_military,
                                      :occupation, :relationship_status,
                                      :_destroy, race_ids: []])
  end

  def find_profile
    @profile = current_user.profile
  end
end
