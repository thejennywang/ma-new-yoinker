require 'rails_helper'

describe "editing restaurants" do
		
		before do
			alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
			@restaurant = alex.restaurants.create(name: "Alex's ", category: "Coffee")
			login_as alex
		end

	context 'logged in as the restaurant creator' do

		it 'can edit the details of a restaurant' do
			visit restaurants_path
			click_link('Edit')

			fill_in 'Name', with: "Jenny's Gastro Pub"
			click_button 'Update Restaurant'

			expect(page).to have_content("Gastro Pub")
			expect(current_path).to eq restaurants_path
		end
	end

	context 'logged in as another user' do

		before do
			jenny = User.create(email: 'j@j.com', password: '12345678', password_confirmation: '12345678')
			login_as jenny
		end

		it 'should display an error' do
			visit restaurants_path
			click_link('Edit')

			expect(page).to have_content("This is not your restaurant!")
		end
	end
end