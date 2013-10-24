require "test_helper"

feature "creating a post" do
  scenario "with valid data" do

    sign_in

    # Given a completed post form
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: 'Killer'
    fill_in 'Body', with: 'This post is da best!'

    # When I submit the form
    click_on 'Create Post'

    #Then I shoud see the new post
    page.text.must_include 'Killer'
    page.text.must_include 'This post is da best!'

    # Add a success message
    page.text.must_include 'Post was successfully created.'
    assert page.has_css?('.jumbotron')
    page.text.must_include users(:editor).email

  end

  scenario "authors can't publish" do
    # Given a new author's post
    sign_in(:author)
    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end
end
