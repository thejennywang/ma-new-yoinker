class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])

		@review = @restaurant.reviews.new(params[:review].permit(:comment, :rating))
		@review.user = current_user

		if @review.save
			redirect_to restaurant_path(@restaurant)
		else 
			render 'new'
		end
	end
end
