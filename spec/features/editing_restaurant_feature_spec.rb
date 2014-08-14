require 'rails_helper'

describe "editing restaurants" do

	before do
		restaurant = Restaurant.create(name: "Jenny's Cafe", category: "Coffee")
		alex = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
		login_as alex
	end

		it 'can edit the details of a restaurant' do
		visit restaurants_path
		click_link('Edit')

		fill_in 'Name', with: "Jenny's Gastro Pub"
		click_button 'Update Restaurant'

		expect(page).to have_content("Gastro Pub")

	end
end