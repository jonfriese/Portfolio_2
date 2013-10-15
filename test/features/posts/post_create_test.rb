require "test_helper"

feature "creating a post" do
  scenario "with valid data" do

    # Given a completed post form
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: ':cr'
    fill_in 'Body', with: ':cf'

    # When I submit the form
    click_on 'Create Post'

    #Then I shoud see the new post
    page.text.must_include ':cr'
    page.text.must_include ':cf'

    # Add a success message
    page.text.must_include 'Post was successfully created.'

  end
end
