class EmotionsController < ApplicationController
  before_action :find_preference

  def new
  end

  def show
    @emotion = @preference.emotion
  end

  def edit
    @emotion = @preference.emotion? ? @preference.emotion : @preference.build_emotion
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, @preference.emotion]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(emotion_attributes: [
      :hightest_level_of_emotional_disability_in_a_child_your_family_will_consider]
    )
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
