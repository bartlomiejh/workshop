class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname
  end

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user
      redirect_to new_user_session_path
      false
    end
  end

  def meta_events_tracker
    @meta_events_tracker ||= MetaEvents::Tracker.new(current_user.try(:id), request.remote_ip)
  end

  def after_sign_in_path_for(resource)
    register_user_in_mixpanel
    meta_events_tracker.event!(:user, :sign_in)
    super
  end

  private
  def register_user_in_mixpanel
    if meta_events_tracker.event_receivers.first.respond_to? :people
      meta_events_tracker.event_receivers.first.people.set(current_user.id, {
        '$first_name' => current_user.firstname,
        '$last_name' => current_user.lastname
      })
    end
  end
end
