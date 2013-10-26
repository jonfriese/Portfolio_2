require "test_helper"

feature "Deleting comments" do
  scenario "an editor can delete comments" do

  sign_in

  visit post_path(posts(:cr))

  fill_in :comment_author, with:       "Bill"
  fill_in :comment_author_email, with: "Bill@example.com"
  fill_in :comment_content, with:      "Dis posts sucks"

  click_on 'Submit for approval'

  click_on 'Destroy'

  page.text.must_include 'Comment has been destroyed.'

  end
end
