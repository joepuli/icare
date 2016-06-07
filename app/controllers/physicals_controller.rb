class PhysicalsController < ApplicationController
  before_action :find_preference

  def new
  end

  def show
    @physical = @preference.physical
  end

  def edit
    @physical = @preference.physical? ? @preference.physical : @preference.build_physical
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, @preference.physical]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(physical_attributes: [
      :hightest_level_of_physical_or_medical_disability_in_a_child_your_family_will_consider]
    )
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
