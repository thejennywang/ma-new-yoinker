require 'rails_helper'

describe 'Reviews' do
	
	before do
		Restaurant.create(name: "Charlotte's Bistro", category: "French")
	end

	context 'when a restaurant has no reviews' do
		
		it 'a user should be able to add a review' do
			visit '/restaurants'
			click_link('Charlotte\'s Bistro')
			expect(page).to have_content("No reviews yet")
			expect(page).to have_content("Add a review")
		end
	end

end