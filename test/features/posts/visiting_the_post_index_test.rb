require "test_helper"

feature "Visiting the Post Index" do
  scenario "the existing posts, shows list" do

    find('#blog').click
    page.text.must_include posts(:cf).title
  end
end
