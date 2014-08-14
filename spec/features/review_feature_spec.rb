require 'rails_helper'

describe 'Reviews for restaurants' do
	
	before(:each) do
		Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
		alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
		login_as alex
	end

	it 'user fills out a form to add a review that will be viewable on the restaurant page' do
		leave_review 'Excellent', 5
		
		expect(page).to have_content("Excellent")
		expect(page).to have_content("5")
	end

	it 'displays the average rating from all reviews' do
		leave_review 'Excellent', 5
		leave_review 'So so', 3

		expect(page).to have_content('Average rating: 4')
	end

end