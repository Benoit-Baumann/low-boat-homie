class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :error

  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :search], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :search], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :date_of_birth, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :date_of_birth, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
