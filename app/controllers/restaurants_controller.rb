class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def create
		name = params[:restaurant][:name]
		category = params[:restaurant][:category]
		Restaurant.create(name: name, category: category)
		redirect_to '/restaurants'
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(name: params[:restaurant][:name], category: params[:restaurant][:category])
		redirect_to '/restaurants'

	end

end
	