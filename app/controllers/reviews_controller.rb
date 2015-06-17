class ReviewsController < ApplicationController
  before_action :authenticate_user!
  expose(:review)
  expose(:product)
  expose(:category)

  def create
    self.review = Review.new(review_params)
    review.user = current_user

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
