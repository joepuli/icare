class RisksController < ApplicationController
  before_action :find_preference

  def index
    @risks = @preference.risks
  end

  def new
  end

  def show

  end

  def edit

  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to [@preference, :risks]
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(risk_ids: [])
  end

  def find_preference
    @preference = current_user.profile.preference
  end
end
