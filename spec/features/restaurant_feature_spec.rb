require 'rails_helper'

describe 'Yoink' do

	context 'when user is logged out' do
		it 'should prompt to sign in' do
			visit restaurants_path
			click_link 'Add a restaurant'

			expect(page).to have_content 'sign in'
		end
	end

	context 'when user is logged in' do

		before do
			alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
			login_as alex
		end
	
	
		context 'when there are no restaurants' do
			
			it 'allows adding a restaurant' do
				visit restaurants_path
				expect(page).to have_content('No restaurants yet')
				expect(page).to have_link('Add a restaurant')
			end
		end

		context 'where restaurants have been added' do

			before do
				Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
			end

			it 'displays restaurants and cuisine type' do
				visit restaurants_path
				expect(page).to have_content ("Jenny's Cafe")
				expect(page).to have_content ("Coffee")
			end

			it 'displays details of a restaurant' do
				visit restaurants_path
				click_link("Jenny's Cafe")
				expect(page).to have_content("Jenny's Cafe")
				expect(page).to have_content("Reviews")
			end

			it 'can add a restaurant' do
				visit restaurants_path
				click_link('Add a restaurant')
				expect(page).to have_content('Enter restaurant details')
				add_restaurant(name: "Charlotte's Bistro", category: "French")
				expect(page).to have_content("Charlotte's Bistro")
			end

			it 'can delete a restaurant when user clicks delete link' do
				visit restaurants_path
				click_link('Delete')
				expect(page).to have_content("Jenny's Cafe has been deleted")
				expect(page).not_to have_content("Jenny's Cafe - ")
			end

			it 'can show individual restaurant pages' do
				visit restaurants_path
				click_link('Jenny\'s Cafe')
				expect(page).to have_content('No reviews yet')
			end
		end
	end
end

