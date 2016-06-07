class LearningsController < ApplicationController
  before_action :find_preference

  def new
  end

  def show
    @learning = @preference.learning
  end

  def edit
    @learning = @preference.learning? ? @preference.learning : @preference.build_learning
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, @preference.learning]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(learning_attributes: [
      :hightest_level_of_learning_disability_in_a_child_your_family_will_consider]
    )
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
