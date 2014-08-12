require 'rails_helper'

describe 'Restaurants Index' do
	
	context 'when there are no restaurants' do
		
		it 'should allow adding a restaurant' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants yet')
			expect(page).to have_link('Add a restaurant')
		end
	end

	context 'can add, display, modify and delete listings' do

		before(:each) do
			Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
		end

		it 'displays restaurants and cuisine type' do
			visit '/restaurants'
			expect(page).to have_content ("Jenny's Cafe")
			expect(page).to have_content ("Coffee")
		end

		it 'can show details of a restaurant' do
			visit '/restaurants'
			click_link("Jenny's Cafe")
			expect(page).to have_content("Jenny's Cafe")
			expect(page).to have_content("Reviews")
		end

		it 'can add a restaurant' do
			visit '/restaurants'
			click_link('Add a restaurant')
			expect(page).to have_content('Enter restaurant details')
			add_restaurant(name: "Charlotte's Bistro", category: "French")
			expect(page).to have_content("Charlotte's Bistro")
		end

		it 'can edit the details of a restaurant' do
			visit '/restaurants'
			click_link('Edit')
			expect(page).to have_content("Update Jenny's Cafe")
			update_restaurant(category: "Gastro Pub")
			expect(page).to have_content("Gastro Pub")
		end

		it 'can delete a listing' do
			visit '/restaurants'
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

def add_restaurant(name: name, category: category)
	fill_in 'Name', with: name
	fill_in 'Category', with: category
	click_button 'Create Restaurant'
end

def update_restaurant(category: category)
	fill_in 'Category', with: category
	click_button 'Update Restaurant'
end

