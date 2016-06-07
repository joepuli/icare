class BehaviorsController < ApplicationController
  before_action :find_preference

  def new
  end

  def show
    @behavior = @preference.behavior
  end

  def edit
    @behavior = @preference.behavior? ? @preference.behavior : @preference.build_behavior
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, @preference.behavior]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(behavior_attributes: [
      :highest_level_of_behavior_issue_your_family_will_consider]
    )
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
