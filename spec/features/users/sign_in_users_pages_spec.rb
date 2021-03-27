require 'rails_helper'

describe "the sign in process" do
  it "signs in with an existing account" do
    User.create({email: "email@gmail.com", password: "password", admin: false})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "email@gmail.com"
    fill_in 'user_password', :with => "password"
    click_on 'Log in'
    expect(page).to have_content "Signed in successfully."
  end
end