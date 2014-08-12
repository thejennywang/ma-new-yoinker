require 'rails_helper'

RSpec.describe Review, :type => :model do

	let(:restaurant) do
			Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
		end
  
  it 'requires a rating' do
  	restaurant.reviews.create
  	expect(restaurant.reviews.count).to eq 0
  end

  it 'cannot have a rating of 8' do
  	restaurant.reviews.create(comment:"Excellent", rating: 8)
  	expect(restaurant.reviews.count).to eq 0
	end

end
