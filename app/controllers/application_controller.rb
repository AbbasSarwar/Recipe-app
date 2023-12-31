class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password)
    end
  end
end
