class FlagsController < ApplicationController
    before_action :current_review
    def new
        @flag = Flag.new(review: @review)
    end 
    
    def create 
        @review = Review.find(params[:review_id])
        @bath = Bath.find_by_id(params[@review.bath_id])
        @flag = @review.flags.build(flag_params)
        @flag.user_id = current_user.id
        if @flag.save
          flash[:success] = "Flagged as inapproriate"
          redirect_to showbath_path
        else
          flash[:danger] = "Unable to create flag"
          render 'new'
        end
    end
    
    private
        def current_review
            @review = Review.find_by_id(params[:review_id])
        end
        
        def flag_params
        params.require(:flag).permit(:reason, :count)
        end
end