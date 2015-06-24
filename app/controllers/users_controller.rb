class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:user) { current_user }
  expose_decorated(:reviews) { current_user.reviews.order(created_at: :desc).limit(5) }

  def show
    meta_events_tracker.event!(:user, :profile)
  end
end
