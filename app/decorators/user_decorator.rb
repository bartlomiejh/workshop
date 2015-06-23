class UserDecorator < Draper::Decorator
  delegate_all

  def member_since
    created_at.strftime('%B %Y')
  end

  def full_name
    "#{firstname} #{lastname}"
  end
end
