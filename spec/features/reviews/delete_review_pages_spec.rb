require 'rails_helper'

describe "the delete review process" do
  it "deletes a review" do
    User.create({email: "admin@gmail.com", password: "adminpassword", admin: true})
    @product = Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA" })
    @product.reviews.create({author: "mekinsie", rating: 4, content_body: 'These cheese puffs are very cheesy and crunchy. I would definitely buy them again.', email: "mekinsie.aja@gmail.com" })
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "admin@gmail.com"
    fill_in 'user_password', :with => "adminpassword"
    click_on 'Log in'
    click_link 'Products'
    click_link 'Cheese Puffs'
    click_link 'See details'
    click_link 'Delete Review'
    expect(page).to have_no_content "These cheese puffs are very cheesy and crunchy. I would definitely buy them again"
  end
end