require "test_helper"

feature "editing a post" do
  scenario "a post is present" do
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)
    click_on "Edit"
    fill_in 'Body', with: 'this post is new'
    click_on "Update Post"
    page.text.must_include 'this post is new'
  end
end
