class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
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

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.delete
		flash[:notice] = "#{@restaurant.name} has been deleted."
		redirect_to '/restaurants'

	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

end
	