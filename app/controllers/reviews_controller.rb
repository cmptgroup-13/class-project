class ReviewsController < ApplicationController
  before_action :current_bath
   
  
  def new
    @review = Review.new(bath: @bath)
  end

  def create
    @review = @bath.reviews.build(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to showbath_path
  end

  def delete
  end

  def edit
  end

  def show
    
    @reviews = @bath.reviews.all
  end

  def update
  end
  
  # def destroy
  #   Review.find(params[:id]).destroy
  #   redirect_to view_path, notice: "Review Deleted"
  # end


private

  def current_bath
    @bath = Bath.find_by_id(params[:bath_id])
  end
  
  def review_params
    params.require(:review).permit(:post)
  end

end
