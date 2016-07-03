class ReviewsController < ApplicationController
  def new
    @bath = current_user.baths.find_by_id(params[:bath_id])
    @review = Review.new(bath: @bath)
  end

  def create
    @bath = current_user.baths.find_by_id(params[:bath_id])
    @review = current_user.reviews.build(review_params)
    # @bath.reviews = @review
    @review.save
    redirect_to showbath_path
  end

  def delete
  end

  def edit
  end

  def show
  end

  def update
  end


private

  def review_params
    params.require(:review).permit(:post)
  end

end
