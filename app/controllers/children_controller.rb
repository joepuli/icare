class ChildrenController < ApplicationController
  before_action :find_profile

  def index
    @children = @profile.children
  end

  def edit
    @profile.children? ? @profile.children : @profile.children.build
  end

  def update
    if @profile.update_attributes(profile_attributes)
      redirect_to [@profile, :children]
    else
      render :edit
    end
  end

  private

  def profile_attributes
    params.require(:profile).permit(children_attributes: [:id, :gender,
                                      :birth_month_and_year,
                                      :child_became_part_of_family_by,
                                      :any_challenges_or_disabilities?,
                                      :_destroy])
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
end
