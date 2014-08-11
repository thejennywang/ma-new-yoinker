class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def create
		Restaurant.create(params[:restaurant].permit(:name, :category))
		redirect_to '/restaurants'
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name, :category))
		redirect_to '/restaurants'

	end

end
	