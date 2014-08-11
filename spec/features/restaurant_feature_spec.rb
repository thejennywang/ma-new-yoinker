require 'rails_helper'

describe 'Restaurants Index' do
	
	context 'when there are no restaurants' do
		
		it 'should allow adding a restaurant' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants yet')
			expect(page).to have_link('Add a restaurant')
		end
	end

	context 'when restaurants have been added' do

		before(:each) do
			Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
		end

		it 'displays the restaurant and cuisine type' do
			visit '/restaurants'
			expect(page).to have_content ("Jenny's Cafe")
			expect(page).to have_content ("Coffee")
		end

	end

	context 'adding a restaurant' do

		it 'can add a restaurant' do
			visit '/restaurants'
			click_link('Add a restaurant')
			expect(page).to have_content('Enter restaurant details')
			add_restaurant(name: "Charlotte's Bistro", category: "French")
			expect(page).to have_content("Charlotte's Bistro")
		end

		it 'can edit the details of a restaurant' do
			Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
			visit '/restaurants'
			click_link('Edit')
			expect(page).to have_content("Update Jenny's Cafe")
			update_restaurant(category: "Gastro Pub")
			expect(page).to have_content("Gastro Pub")
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

