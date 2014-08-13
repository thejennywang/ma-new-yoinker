def add_restaurant(name: name, category: category)
	fill_in 'Name', with: name
	fill_in 'Category', with: category
	click_button 'Create Restaurant'
end

def update_restaurant(category: category)
	fill_in 'Category', with: category
	click_button 'Update Restaurant'
end