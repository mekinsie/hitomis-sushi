require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :email }
  it { should validate_numericality_of :rating }

  # it("titleizes the author of the review") do
  #   review = Review.create({:author => "mekinsie", :content_body => "The oatmeal tastes delicious.", :rating => 5})
  #   expect(review.author).to eq("Mekinsie")
  # end

end