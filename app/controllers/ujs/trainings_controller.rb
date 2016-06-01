class Ujs::TrainingsController < ApplicationController
  before_action :find_profile, :find_training
  respond_to :js

  def edit
    respond_with(@training, location: @profile)
  end

  def update
    if @training.update_attributes(training_attributes)
      respond_with(@training, location: @profile)
    end
  end

  def destroy
    respond_with(@training, location: @profile) if @training.destroy
  end

  private

  def training_attributes
    params.require(:training).permit(:name)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_training
    @training = @profile.trainings.find(params[:id])
  end
end
