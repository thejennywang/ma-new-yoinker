class Restaurant < ActiveRecord::Base
	has_many :reviews	
	belongs_to :user

	validates :name, presence: true, length: {minimum: 3}, format: {with: /\A[A-Z]/, message: 'must begin with a capital letter'}, uniqueness: true
	validates :category, presence: true

	def average_rating
		return 'N/A' if reviews.none?
		reviews.average(:rating).round(1)
	end
end

