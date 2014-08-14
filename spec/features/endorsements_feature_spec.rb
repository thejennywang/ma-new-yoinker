require 'rails_helper'

describe 'endorsing reviews' do
	before do
		@kfc = Restaurant.create(name: 'KFC', category: "Fast food")
		@kfc.reviews.create(rating: 2, comment: "Okay")
	end

	it "can endorse reviews, updating the review's endorsement count", js: true do
		puts @kfc.inspect
		visit restaurant_path(@kfc)
		find('.like-btn').click
		expect(page).to have_css '.endorsement_count', text: '1'
	end
end

