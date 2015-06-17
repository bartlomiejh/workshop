class CategoryDecorator < Draper::Decorator
  delegate_all

  def can_edit_any_product? user
    products.collect { |p| p.can_edit? user }.include? true
  end
end
