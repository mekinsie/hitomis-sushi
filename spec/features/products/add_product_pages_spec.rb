require 'rails_helper'

describe "the add product process" do
  it "adds a new product" do
    visit '/'
    click_link 'Products'
    click_link 'Create new product'
    fill_in "product_name", :with => 'cheese puffs'
    fill_in "product_cost", :with => '5.99'
    fill_in "product_country_of_origin", :with => 'USA'
    click_on 'Submit'
    expect(page).to have_content "Cheese Puffs"
  end

  it "gives an error when no name, cost, or country is entered" do
    visit '/products/new'
    fill_in "product_name", :with => ''
    fill_in "product_cost", :with => ''
    fill_in "product_country_of_origin", :with => ''
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end
end