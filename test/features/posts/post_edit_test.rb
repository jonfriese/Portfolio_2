require "test_helper"

feature "editing a post" do
  scenario "a post is present" do

    @user = users(:fake)
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit post_path(posts(:cr))

    click_on "Edit"
    fill_in 'Body', with: 'this post is new'

    click_on "Update Post"
    page.text.must_include 'this post is new'
  end
end
