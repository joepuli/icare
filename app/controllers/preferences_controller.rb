class PreferencesController < ApplicationController
  before_action :find_profile
  before_action :find_preference, only: [:edit, :update, :show]

  def new
    @preference = @profile.build_preference
  end

  def create
    @preference = @profile.build_preference(preference_attributes)
    if @preference.save
      redirect_to @preference
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @preference.update_attributes(preference_attributes)
      redirect_to @preference
    else
      render :edit
    end
  end

  private

  def preference_attributes
    params.require(:preference).permit(:gender, :racial_composition,
                                       :youngest_age_acceptable,
                                       :oldest_age_acceptable,
                                       :minimum_number_of_children,
                                       :maximum_number_of_children,
                                       :consider_LGBTQ_youth)
  end

  def find_profile
    @profile = current_user.profile
  end

  def find_preference
    @preference = Preference.find(params[:id])
  end
end
