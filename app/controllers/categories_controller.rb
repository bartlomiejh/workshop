class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_filter :ensure_admin!, only: [:new, :edit, :update, :destroy, :create]

  expose(:categories)
  expose_decorated(:category)
  expose(:product) { Product.new }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user
      redirect_to new_user_session_path
      false
    end
  end
end
