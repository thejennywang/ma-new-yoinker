require 'rails_helper'

RSpec.describe Review, :type => :model do

  it 'requires a rating' do
    restaurant = Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
    restaurant.reviews.create
    expect(restaurant.reviews.count).to eq 0
  end

  it 'requires rating to be between 1 and 5' do
		restaurant = Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
  	review = restaurant.reviews.create(comment:"Excellent", rating: 8)
  	expect(review).to have(1).error_on(:rating)
	end

end
