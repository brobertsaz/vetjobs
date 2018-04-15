class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      set_flash_message :notice, :"#{resource.role}_signed_up" if is_flashing_format?
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def edit
    render :edit
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :company_name])
  end

  def after_sign_up_path_for(resource)
    resource.has_profile? ? edit_profile_path(resource.id) : new_profile_path(resource.id)
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  def build_resource(hash = {})
    self.resource = case hash.delete(:role)
      when 'Candidate'
        User
      when 'Employer'
        Employer
      else
        resource_class
    end.new_with_session(hash || {}, session)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
