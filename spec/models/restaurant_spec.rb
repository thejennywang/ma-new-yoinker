require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

  let(:restaurant) { Restaurant.create(name: "Test", category: "test") }
  let(:user) { User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678') }
  let(:user2) { User.create(email: 'b@b.com', password: '12345678', password_confirmation: '12345678') }

  describe "#average_rating" do

    context 'no reviews' do
      it 'returns N/A' do
        expect(restaurant.average_rating).to eq "N/A"
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant.reviews.create(rating: 4, user: user)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'returns the average rating' do
      restaurant.reviews.create(rating: 3, user: user)
      restaurant.reviews.create(rating: 5, user: user2)

      expect(restaurant.average_rating).to eq 4
      end

      it 'returns a float if average is not a whole number' do
      restaurant.reviews.create(rating: 4, user: user)
      restaurant.reviews.create(rating: 5, user: user2)

      expect(restaurant.average_rating).to eq 4.5
      end
    end

  end

  describe 'validations' do

    it 'must have a name > 2 characters, starting with a capital letter and have a category' do
      expect(restaurant).to be_valid
    end

    it 'must have a name > 2 characters' do
      restaurant_with_short_name = Restaurant.create(name: "Ab")
      expect(restaurant_with_short_name).to have(1).error_on(:name)
    end

    it 'must have a unique name' do
      Restaurant.create(name: "Test", category: "test")
      duplicate_restaurant = Restaurant.new(name: "Test", category: "test")

      expect(duplicate_restaurant).to have(1).error_on(:name)
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
      restaurant.reviews.create(rating: 4, user: user)
      restaurant.reviews.create(rating: 5, user: user2)
      expect(restaurant.average_rating).to eq 4.5
    end
  end
end
