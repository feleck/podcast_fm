class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_premitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_premitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { 
      |u| u.permit(:email, :password, :password_confirmation, :title)
    }
    devise_parameter_sanitizer.for(:account_update) { 
      |u| u.permit(:email, :password, :password_confirmation, :current_password, :title, :description, :itunes, :stitcher, :podbay) 
    }
  end
end
