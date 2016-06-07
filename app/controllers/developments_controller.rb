class DevelopmentsController < ApplicationController
  before_action :find_preference

  def new
  end

  def show
    @development = @preference.development
  end

  def edit
    @development = @preference.development? ? @preference.development : @preference.build_development
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, @preference.development]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(development_attributes: [
      :hightest_level_of_development_disability_in_a_child_your_family_will_consider]
    )
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
