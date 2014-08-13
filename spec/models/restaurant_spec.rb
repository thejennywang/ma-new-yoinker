require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

  let (:restaurant) { Restaurant.create(name: "Test", category: "test") }

  describe "#average_rating" do
    context 'no reviews' do
      it 'returns N/A' do
        expect(restaurant.average_rating).to eq "N/A"
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'returns the average rating' do
        restaurant.reviews.create(rating: 5)
        restaurant.reviews.create(rating: 3)

        expect(restaurant.average_rating).to eq 4
      end

      it 'returns a flot if average is not a whole number' do
        restaurant.reviews.create(rating: 5)
        restaurant.reviews.create(rating: 4)

        expect(restaurant.average_rating).to eq 4.5
      end
    end

  end

  describe 'validations' do

    it 'must have a name > 2 characters, starting with a capital letter and have a category' do
      expect(restaurant).to be_valid
    end

    it 'must have a name' do
      expect(Restaurant.count).to eq 0
    end

    it 'must have a name > 2 characters' do
      restaurant_with_short_name = Restaurant.create(name: "Ab")
      expect(restaurant_with_short_name).to have(1).error_on(:name)
    end

    it 'must have name with its first letter capitalized' do
      restaurant_with_uncapitalized_name = Restaurant.create(name: "abc")
      expect(restaurant_with_uncapitalized_name).to have(1).error_on(:name)
    end

    it 'must have a category' do
      restaurant_with_no_category = Restaurant.create(name: "Some Name")
      expect(restaurant_with_no_category).to have(1).error_on(:category)
    end

    it 'has an average rating' do
      restaurant.reviews.create(rating: 4)
      restaurant.reviews.create(rating: 5)
      expect(restaurant.average_rating).to eq 4.5
    end
  end
end
