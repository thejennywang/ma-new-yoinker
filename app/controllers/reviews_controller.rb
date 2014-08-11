class ReviewsController < ApplicationController

	def new
		@review = Review.new(restaurant_id: params[:format])
		puts @review.inspect
	end

	def create
		Review.create(params[:review].permit(:rating, :comment, :restaurant_id))
		flash[:notice] = "Thank you for your review!"
		redirect_to "/restaurants"
	end
end
