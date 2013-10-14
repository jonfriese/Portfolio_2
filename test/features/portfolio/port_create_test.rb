require "test_helper"

feature "Creating a new portfolio item." do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "New Project"
    fill_in "Technologies used", with: "Rails"
    click_on "Create Project"
    page.text.must_include "Portfolio was successfully created"
    page.text.must_include "Rails"
    page.text.must_include "New Project"
  end
end
