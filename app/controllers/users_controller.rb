class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_self!
  expose(:user)

  def show
  end

  private
  def ensure_self!
    redirect_to(root_path, flash: { error: 'You are not allowed to view this user.' }) unless user.eql? current_user
  end
end
