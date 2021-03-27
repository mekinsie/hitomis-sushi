require 'rails_helper'

describe "the edit review process" do
  it "edits a review" do
    product = Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    product.reviews.create({author: "mekinsie", rating: 4, content_body: 'These cheese puffs are very cheesy and crunchy. I would definitely buy them again.', email: "email@gmail.com" })
    User.create({email: "email@gmail.com", password: "password", admin: false})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "email@gmail.com"
    fill_in 'user_password', :with => "password"
    click_on 'Log in'
    click_on 'Products'
    click_link 'Cheese Puffs'
    click_link 'See details'
    click_link 'Edit Review'
    fill_in "review_author", :with => 'Finley'
    select(3, :from => "review_rating")
    fill_in "review_content_body", :with => 'These cheeze puffz are very cheezy and crunchy. I would definitely buy them again.'
    click_on 'Submit'
    expect(page).to have_content "These cheeze puffz are very cheezy and crunchy. I would definitely buy them again."
    expect(page).to have_content "Finley"
  end
  it "fails to edit review as admin" do
    product = Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    product.reviews.create({author: "mekinsie", rating: 4, content_body: 'These cheese puffs are very cheesy and crunchy. I would definitely buy them again.', email: "email@gmail.com" })
    User.create({email: "admin@gmail.com", password: "adminpassword", admin: true})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "admin@gmail.com"
    fill_in 'user_password', :with => "adminpassword"
    click_on 'Log in'
    visit "/products/#{product.id}/reviews/#{product.reviews[0].id}/edit"
    expect(page).to have_content "You cannot edit other reviews"
  end

end


