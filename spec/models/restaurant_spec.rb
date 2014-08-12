require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

  it 'must have a name' do
  	Restaurant.create
  	expect(Restaurant.count).to eq 0
  end

  it 'must have a category' do
  	Restaurant.create(name: "Some Name")
  	expect(Restaurant.count).to eq 0
  end


end
