class ReviewsController < ApplicationController

  def index

  end

  def add
    @review = Reviews.new
    render :index
  end

end
