require 'rails_helper'

describe 'Reviews for restaurants' do
	
	before(:each) do
		Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
	end

	it 'user fills out a form to add a review that will be viewable on the restaurant page' do
		visit restaurants_path
		click_link 'Jenny\'s Cafe'
		click_link 'Add a review'
		fill_in 'Comment', with: "Excellent"
		select '5', from: 'Rating'
		click_button 'Submit Review'
		expect(page).to have_content("Excellent")
		expect(page).to have_content("5")
		end

end