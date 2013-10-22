require "test_helper"

def editor_post

  sign_in(:editor)

  visit posts_path
  click_on "New Post"
  fill_in "Title", with: "Gary Payton"
  fill_in "Body", with: "Is da best!!"
  click_on "Create Post"

  post_id = current_url.split('/').last
end



feature "Editor can edit a post" do
  scenario "a post is present" do

    sign_in

    visit post_path(posts(:cr))

    click_on "Edit"
    fill_in 'Body', with: 'this post is new'

    click_on "Update Post"
    page.text.must_include 'this post is new'
  end
end
