class RestaurantsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

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

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = current_user.restaurants.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:notice] = 'This is not your restaurant!'
		redirect_to restaurants_path
	end

	def update
		@restaurant = current_user.restaurants.find(params[:id])
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
	