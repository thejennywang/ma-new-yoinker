require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

  it 'must have a name > 2 characters, starting with a capital letter and have a category' do
		restaurant = Restaurant.create(name: "Test", category: "test")
    expect(restaurant).to be_valid
  end

  it 'must have a name' do
    restaurant = Restaurant.create
    expect(Restaurant.count).to eq 0
  end

  it 'must have a name > 2 characters' do
    restaurant = Restaurant.create(name: "Ab")
    expect(restaurant).to have(1).error_on(:name)
  end

  it 'must have name with its first letter capitalized' do
    restaurant = Restaurant.create(name: "abc")
    expect(restaurant).to have(1).error_on(:name)
  end

  it 'must have a category' do
    restaurant = Restaurant.create(name: "Some Name")
    expect(restaurant).to have(1).error_on(:category)
  end

  it 'has an average rating' do
    restaurant = Restaurant.create(name: "Test", category: "test")
		restaurant.reviews.create(rating: 4)
		restaurant.reviews.create(rating: 5)
		expect(restaurant.average_rating).to eq 4.5
	end

end
