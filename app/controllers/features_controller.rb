class FeaturesController < Flip::FeaturesController
  before_filter :authenticate_user!
  before_filter :ensure_admin!
end