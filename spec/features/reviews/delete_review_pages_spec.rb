require 'rails_helper'

describe "the delete review process" do
  it "deletes a review" do
    @product = Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    @product.reviews.create({author: "mekinsie", rating: 4, content_body: 'These cheese puffs are very cheesy and crunchy. I would definitely buy them again.'})
    visit '/products'
    click_link 'Cheese Puffs'
    click_link 'See details'
    click_link 'Delete Review'
    expect(page).to have_no_content "These cheese puffs are very cheesy and crunchy. I would definitely buy them again"
  end
end