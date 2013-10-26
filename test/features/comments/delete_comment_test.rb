# require "test_helper"

# feature "deleting comments" do
#   scenario "editor should be able to delete comments" do

#     sign_in

#     visit post_path(posts(:cr))

#     fill_in :comment_author, with: comments(:comment).author
#     fill_in :comment_author_email, with: comments(:comment).author_email
#     fill_in :comment_content, with: comments(:comment).content

#     click_on "Submit for approval"


#     click_button("Destroy", href: "/posts/#{posts(:cr).id}/comments/#{comments(:comment).id}")

#     page.text.must_include "Post has been destroyed."
#   end
# end
