class Ujs::CoursesController < ApplicationController
  before_action :find_profile, :find_course
  respond_to :html, :js

  def edit
  end

  def update
    if @course.update_attributes(course_attributes)
      respond_with(@course, location: @profile)
    end
  end

  def destroy
    respond_with(@course, location: @profile) if @course.destroy
  end

  private

  def course_attributes
    params.require(:course).permit(:name)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_course
    @course = @profile.courses.find(params[:id])
  end
end
