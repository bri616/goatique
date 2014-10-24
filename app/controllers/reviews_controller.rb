class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def add
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to "/products/#{@review.product_id}/about"
    else
      render :add
    end
  end

private
  def review_params
    params.require(:review).permit(:review, :product_id)
  end

end
