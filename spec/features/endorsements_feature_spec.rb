require 'rails_helper'

describe 'endorsing reviews' do
	before do
		alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
		login_as alex
		@kfc = Restaurant.create(name: 'KFC')
		@kfc.reviews.create(rating: 2, comment: "Okay")
	end

	it "can endorse reviews, updating the review's endorsement count", js: true do
		visit restaurant_path(@kfc)
		find('.endorsement-link').click
		expect(page).to have_css '.endorsement_count', text: '1'
	end
end

