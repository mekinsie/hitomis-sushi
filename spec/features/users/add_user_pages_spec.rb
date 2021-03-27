require 'rails_helper'

describe "the sign up process" do
  it "signs up with an email" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => "email@gmail.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end