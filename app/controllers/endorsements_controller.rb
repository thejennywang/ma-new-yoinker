class EndorsementsController < ApplicationController
	def create
 		@review = Review.find(params[:review_id])
		@review.endorsements.create
		redirect_to restaurant_path(@review.restaurant)
	end
end
