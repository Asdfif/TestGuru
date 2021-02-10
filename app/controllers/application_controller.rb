class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{resource.first_name} #{resource.last_name} ! " if resource.first_name || resource.last_name
    if resource.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  protected

  def configure_permitted_parameters
    attributes = %i[first_name last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end  

end
