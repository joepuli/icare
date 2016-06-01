class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    case
    when resource.first_name.blank?
      redirect_to new_profile_path
    else
      profile_path(resource.profile)
    end
  end
end
