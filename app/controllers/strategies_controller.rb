class StrategiesController < Flip::StrategiesController
  before_filter :authenticate_user!
  before_filter :ensure_admin!
end