require "test_helper"

feature " a user can sign in" do
    scenario "sign in with twitter works" do

    sign_in_twitter

    find('#blog').click
    page.must_have_content "Latest Blog Entry"
  end
end

