require 'rails_helper'

describe 'Reviews for restaurants' do
	
	before(:each) do
		jenny = User.create(email: 'j@j.com', password: '12345678', password_confirmation: '12345678')
		login_as jenny
		jenny.restaurants.create(name: "Jenny's Cafe")
	end

	it 'allow users to fill out a form to add a review that will be viewable on the restaurant page' do
		leave_review 'Excellent', 5
		
		expect(page).to have_content("Excellent")
		expect(page).to have_content("5")
	end

	it 'displays the average rating from all reviews' do
		leave_review 'Excellent', 5

		alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
		login_as alex
		leave_review 'So so', 3

		expect(page).to have_content('Average rating: 4')
	end

	it 'does not allow users to leave duplicate reviews' do
		leave_review 'So so', 3
		expect(page).not_to have_content 'Add a review'
	end



end