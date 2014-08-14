require 'rails_helper'

describe 'endorsing reviews' do
	before do
		@kfc = Restaurant.create(name: 'KFC', category: "Fast food")
		@kfc.reviews.create(rating: 2, comment: "Okay")
	end

	it "can endorse reviews, updating the review's endorsement count" do
		visit restaurant_path(@kfc)
		click_link "Endorse this review"
		expect(page).to have_content '1 endorsement'
	end
end

		# find('.like-btn').click
		# expect(page).to have_css '.like-count', text: '1'
