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

feature "Deleting a Post" do
  scenario "editor can delete a post" do

    sign_in

    visit posts_path

    click_link('Destroy', href: "/posts/#{posts(:cr).id}")

    #Then post is destroyed and no longer seen

    page.wont_have_content "Gary Payton"
  end
end
