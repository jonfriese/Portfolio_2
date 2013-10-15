require "test_helper"

feature "Deleting a portfolio item" do
  scenario "post is deleted with a click" do

  @only = projects(:one).id

  visit projects_path

  puts "/projects/#{@only}"
  click_link('Destroy', href: "/projects/#{@only}")

  page.wont_have_content projects(:one).name

  end
end
