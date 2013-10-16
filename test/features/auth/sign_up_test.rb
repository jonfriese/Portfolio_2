require "test_helper"

feature "user sign up authorization" do
  scenario "sign up" do

    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: "test@teset.com"
    fill_in "Password", with: "test"
    fill_in "Password confirmation", with: "test"

    page.text.must_include "Welcome"
    page.text.wont_include "There was a problem"
  end
end
