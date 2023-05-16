class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramters, if: :devise_controller?

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :birth_date])
  end
end
