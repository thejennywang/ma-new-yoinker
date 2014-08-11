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
			expect(page).to have_link("Add a review")
		end

		it 'should post a review to a restaurant listing' do
			visit 'restaurants'
			click_link('Charlotte\'s Bistro')
			click_link('Add a review')
			fill_in 'Rating', with: '5'
			fill_in 'Comment', with: "TEST REVIEW" 
			click_button("Create Review")
			expect(page).to have_content("Thank you for your review!")
		end
	end

end