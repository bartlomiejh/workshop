class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    "#{user.firstname} #{user.lastname}"
  end

  def creation_date
    created_at.strftime('%d-%m-%Y')
  end
end
