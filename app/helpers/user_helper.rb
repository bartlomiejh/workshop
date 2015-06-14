module UserHelper
  def admin? user
    user.try(:admin?)
  end
end
