require "test_helper"

feature " a user can sign in" do
  scenario "signing in to a session" do

    visit root_path

    click_on "Sign In"

    fill_in "Email", with: users(:fake).email
    fill_in "Password", with: "password"

    click_on "Sign in"

    page.text.must_include "Signed in successfully."
  end
end
