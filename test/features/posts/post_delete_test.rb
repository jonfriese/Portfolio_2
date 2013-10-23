require "test_helper"

def author_post

  sign_in(:author)

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

    page.wont_have_content "zimbabwe"
  end

  scenario "an author can delete their own post" do

    post_id = author_post

    click_on "Back"
    click_link("Destroy", href: "/posts/#{post_id}")

    page.wont_have_content "Gary Payton"
  end
end
