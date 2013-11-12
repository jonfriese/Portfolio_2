require "test_helper"

feature " a user can sign out" do
  scenario "signing out of a session" do

    sign_in_twitter

    find('#blog').click

    # find('#signout').click

    page.text.wont_include "Sign Out"
  end
end
