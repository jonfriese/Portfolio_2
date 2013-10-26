require "test_helper"

feature "deleting comments" do
  scenario "editor should be able to delete comments" do

    sign_in

    visit post_path(posts(:cr))

    fill_in :comment_author, with:       "Bill"
    fill_in :comment_author_email, with: "Bill@example.com"
    fill_in :comment_content, with:      "Dis posts sucks"

    #TODO
  end
end
