class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user
      redirect_to new_user_session_path
      false
    end
  end
end
