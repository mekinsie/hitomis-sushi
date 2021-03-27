require 'rails_helper'

describe "the edit user process" do
  it "edits an existing account's email" do
    User.create({email: "email@gmail.com", password: "password", admin: false})
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', :with => "email@gmail.com"
    fill_in 'user_password', :with => "password"
    click_on 'Log in'
    click_link 'Settings'
    fill_in 'user_email', :with => "email2@gmail.com"
    fill_in 'user_current_password', :with => "password"
    click_on 'Update'
    expect(page).to have_content "Your account has been updated successfully."
  end
end