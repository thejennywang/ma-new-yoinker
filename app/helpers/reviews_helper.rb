module ReviewsHelper

	def star_rating rating
		return rating unless rating.respond_to?(:round) 

		rounded_rating = rating.round
		remainder = ( 5 - rating.round)
		( '★' * rounded_rating) + ('☆' * remainder)
	end
end
