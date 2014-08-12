class Restaurant < ActiveRecord::Base
	has_many :reviews	
	validates :name, presence: true, length: {minimum: 3}, format: /\A[A-Z]/
	validates :category, presence: true

	def average_rating
		self.reviews.map{|review| review.rating}.inject(:+).to_f/(self.reviews.length)
	end
end

