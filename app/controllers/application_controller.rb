class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_in) << :email
  #   devise_parameter_sanitizer.for(:sign_up) << :email
  
  #  end
  



  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |params|
    params.permit(
      :email, :password, :password_confirmation, :first_name,
      :last_name, :phone_number
    )
  }
  devise_parameter_sanitizer.for(:account_update) { |params|
    params.permit(
      :email, :password, :password_confirmation, :first_name,
      :last_name, :phone_number
    )
  }
end
end
