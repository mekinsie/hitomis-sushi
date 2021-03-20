require 'faker'

Product.destroy_all
Review.destroy_all

50.times do
  product = Product.create!(name: Faker::Food.dish, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
  5.times do
    review = product.reviews.create!(author: Faker::FunnyName.name, content_body: Faker::Lorem.paragraph(sentence_count: 5), rating: Faker::Number.between(from:1, to: 5))
    product.reviews <<  review
  end
end

p "Created #{Product.count} products and #{Review.count} reviews."
