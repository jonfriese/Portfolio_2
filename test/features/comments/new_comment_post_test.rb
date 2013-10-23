require "test_helper"

feature "Commenting on a post" do
  scenario "any user is allowed to comment" do

    visit post_path(posts(:cr))

    fill_in :comment_author, with:       "Bill"
    fill_in :comment_author_email, with: "Bill@example.com"
    fill_in :comment_content, with:      "Dis posts sucks"

    click_on "Submit for approval"

    page.text.must_include "Comment is awaiting moderation"

  end
end
