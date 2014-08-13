def leave_review comment, rating
	visit restaurants_path
	click_link 'Jenny\'s Cafe'
	click_link 'Add a review'
	fill_in 'Comment', with: comment
	select rating.to_s, from: 'Rating'
	click_button 'Submit Review'
end