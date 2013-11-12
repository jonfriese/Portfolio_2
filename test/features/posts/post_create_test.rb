require "test_helper"

feature "I can create a post" do
  scenario "with valid data" do

    sign_in_twitter
    find('#blog').click
    click_on "Create Post"
    fill_in 'Title', with: 'Killer'
    fill_in 'Body', with: 'This post is da best!'

    # When I submit the form
    click_on 'Create Post'

    #Then I shoud see the new post
    page.text.must_include 'Killer'
    page.text.must_include 'This post is da best!'
  end
end
