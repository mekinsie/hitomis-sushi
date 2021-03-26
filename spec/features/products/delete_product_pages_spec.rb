require 'rails_helper'

describe "the delete product process" do
  it "deletes a product" do
    Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "admin@gmail.com"
    fill_in 'user_password', :with => "adminpassword"
    click_on 'Log in'
    visit '/products/new'
    visit '/products'
    click_link 'Cheese Puffs'
    click_link 'Delete Product'
    expect(page).to have_no_content "Cheese Puffs"
  end
end