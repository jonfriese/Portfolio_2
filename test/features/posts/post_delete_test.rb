require "test_helper"

feature "I can delete a Post" do
  scenario "editor can delete a post" do

    sign_in

    visit posts_path

    click_link('Destroy', href: "/posts/#{posts(:cr).id}")

    #Then post is destroyed and no longer seen

    page.wont_have_content "zimbabwe"
  end
end
