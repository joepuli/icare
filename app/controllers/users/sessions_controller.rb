class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    case
    when resource.first_name.blank?
      new_profile_path
    else
      profile_path(resource.profile)
    end
  end
end
