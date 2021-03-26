require 'rails_helper'

describe "the add review process" do
  before :each do
    User.create({email: "email@gmail.com", password: "password", admin: false})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "email@gmail.com"
    fill_in 'user_password', :with => "password"
    click_on 'Log in'
  end
  it "adds a review to a product" do
    Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    click_link 'Products'
    click_link 'Cheese Puffs'
    click_link 'Add a review'
    fill_in "review_author", :with => 'mekinsie'
    select(4, :from => "review_rating")
    fill_in "review_content_body", :with => 'These cheese puffs are very cheesy and crunchy. I would definitely buy them again.'
    click_on 'Submit'
    expect(page).to have_content "These cheese puffs are very cheesy and crunchy. I would definitely buy them again"
  end

  it "gives an error when no author or content_body is entered" do
    Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    click_link 'Products'
    click_link 'Cheese Puffs'
    click_link 'Add a review'
    fill_in "review_author", :with => ''
    select(4, :from => "review_rating")
    fill_in "review_content_body", :with => ''
    click_on 'Submit'
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end
end