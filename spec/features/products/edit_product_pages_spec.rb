# require 'rails_helper'

# describe "the edit product process" do
#   it "edits name, cost, and counrtry of a product" do
#     Product.create({name: "Cheese Puffs", cost: 5.99, country_of_origin: "USA"})
#     current_user = User.create({email: "admin@gmail.com", password: "adminpassword", admin: true})
#     visit '/products'
#     click_link 'Cheese Puffs'
#     click_link 'Edit Product'
#     fill_in "product_name", :with => 'cheeze puffz'
#     fill_in "product_cost", :with => '4.99'
#     fill_in "product_country_of_origin", :with => 'Mexico'
#     click_on 'Submit'
#     expect(page).to have_content "Cheeze Puffz"
#     expect(page).to have_content "4.99"
#     expect(page).to have_content "Mexico"
#   end
# end
