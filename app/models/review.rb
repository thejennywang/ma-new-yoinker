class Review < ActiveRecord::Base
	belongs_to :restaurant
	has_many :endorsements
	validates :rating, presence: true, inclusion: 1..5
end
