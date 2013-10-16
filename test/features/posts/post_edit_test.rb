require "test_helper"

feature "editing a post" do
  scenario "a post is present" do

    sign_in

    visit post_path(posts(:cr))

    click_on "Edit"
    fill_in 'Body', with: 'this post is new'

    click_on "Update Post"
    page.text.must_include 'this post is new'
  end
end
