class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # If we want to add extra field to devise gem like first_name and last_name user edit or create form.
  # When submit form we need to add the above in order to save to DB table
  # -----------------------------------------------------------------------
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
  # -----------------------------------------------------------------------
end
