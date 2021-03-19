require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it("titleizes the name of the product") do
    product = Product.create({:name => "oatmeal", :cost => 3, :country_of_origin => "United States of America"})
    expect(product.name).to eq("Oatmeal")
  end

  it("titleizes the country of origin of the product") do
    product = Product.create({:name => "oatmeal", :cost => 3, :country_of_origin => "united states of america"})
    expect(product.country_of_origin).to eq("United States Of America")
  end
end