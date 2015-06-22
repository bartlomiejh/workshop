# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  u = User.create!(email: "user#{i}@a.com", firstname: "Firstname#{i}", lastname: "Lastname#{i}", password: 'Qwerty123')

  c = Category.create!(name: "Category##{u.email.split('@').first}")

  product_params = {
    title: "Title##{c.name}",
    description: 'description',
    price: [*1..10].sample,
    category: c,
    user: u
  }
  p = Product.create!(product_params)

  review_params = {
    content: 'content',
    rating: [*1..5].sample,
    user: u,
    product: p
  }

  Review.create!(review_params)
end
User.create!(email: "admin@a.com", firstname: 'AdminFirst', lastname: 'AdminLast', password: 'Qwerty123', admin: true)

