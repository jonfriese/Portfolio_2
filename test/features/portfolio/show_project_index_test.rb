require "test_helper"

feature "Display my portfolio" do
  scenario "viewing projects" do

    visit projects_path

    page.text.must_include "JonFriese"
    page.text.must_include "Rails"
  end
end
