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
    click_on 'Delete my account'
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
  end
end