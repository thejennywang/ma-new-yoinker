# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

jenny = Restaurant.create(name: "Jenny's Cafe", category: 'Coffee')
jenny.reviews.create(rating: 1, comment: "Bad")
jenny.reviews.create(rating: 2, comment: "Okay")
jenny.reviews.create(rating: 3, comment: "Good")
jenny.reviews.create(rating: 4, comment: "Great")
jenny.reviews.create(rating: 5, comment: "Amazing")

charlotte = Restaurant.create(name: "Charlotte's Bistro", category: 'French')
charlotte.reviews.create(rating: 1, comment: "Really Bad")
charlotte.reviews.create(rating: 2, comment: "Really Okay")
charlotte.reviews.create(rating: 3, comment: "Really Good")
charlotte.reviews.create(rating: 4, comment: "Really Great")
charlotte.reviews.create(rating: 5, comment: "Really Amazing")

bob = Restaurant.create(name: "Bob's Kebabs", category: 'Fast Food')
bob.reviews.create(rating: 1, comment: "Hella Bad")
bob.reviews.create(rating: 2, comment: "Hella Okay")
bob.reviews.create(rating: 3, comment: "Hella Good")
bob.reviews.create(rating: 4, comment: "Hella Great")
bob.reviews.create(rating: 5, comment: "Hella Amazing")

