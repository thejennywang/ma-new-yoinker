require 'rails_helper'

describe 'Yelperoni' do
	
	context 'when there are no restaurants' do
		
		it 'allows adding a restaurant' do
			visit '/restaurants'
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

		it 'can edit the details of a restaurant' do
			visit restaurants_path
			click_link('Edit')
			expect(page).to have_content("Update Jenny's Cafe")
			update_restaurant(category: "Gastro Pub")
			expect(page).to have_content("Gastro Pub")
		end

		it 'can delete a restaurant' do
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

		it 'shows the average rating of a restaurant' do
			restaurant = Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
			restaurant.reviews.create(rating: 4)
			restaurant.reviews.create(rating: 5)
			
			visit restaurants_path(restaurant)
			expect(page).to have_content('Average rating: 4.5')
		end

	end


end

def add_restaurant(name: name, category: category)
	fill_in 'Name', with: name
	fill_in 'Category', with: category
	click_button 'Create Restaurant'
end

def update_restaurant(category: category)
	fill_in 'Category', with: category
	click_button 'Update Restaurant'
end

