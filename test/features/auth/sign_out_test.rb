require "test_helper"

feature " a user can sign out" do
  scenario "signing out of a session" do

    visit new_user_session_path

    fill_in "Email", with: users(:fake).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    page.text.must_include "Signed in successfully."

    click_on "Sign Out"

    page.text.wont_include "Sign Out"
  end
end
