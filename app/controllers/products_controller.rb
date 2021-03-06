class ProductsController < ApplicationController
  # @q: some of category actions where open, what with product index and show?
  before_action :authenticate_user!
  # @q: not owner can delete?
  before_action :ensure_owner!, only: [:edit, :update]
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user = current_user
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      meta_events_tracker.event!(:product, :create, { product_id: product.id, category_id: category.id, price: product.price })
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def ensure_owner!
    redirect_to(category_product_url(category, product), flash: { error: 'You are not allowed to edit this product.' }) unless product.can_edit? current_user
  end
end
