def create_entries u
  u_prefix = u.email.split('@').first
  c = Category.create!(name: "name##{u_prefix}")

  product_params = {
      description: 'description',
      category: c,
      user: u
  }
  review_params = {
      content: 'content',
      user: u
  }
  3.times do |i|
    p = Product.create!({ title: "title##{i}##{u_prefix}", price: [*1..10].sample }.merge(product_params))
    10.times do |j|
      Review.create!({ product: p, rating: [*1..5].sample, }.merge(review_params))
    end
  end
end

5.times do |i|
  create_entries User.create!(email: "user#{i}@a.com", firstname: "Firstname#{i}", lastname: "Lastname#{i}", password: 'Qwerty123')
end
create_entries User.create!(email: "admin@a.com", firstname: 'AdminFirst', lastname: 'AdminLast', password: 'Qwerty123', admin: true)


