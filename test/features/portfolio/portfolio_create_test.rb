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

  scenario "new project has invalid data" do
    # given ivalid data
    visit new_project_path
    fill_in "Name", with: "Q"

    #When a form is submitted incorrectly
    click_on "Create Project"

    #The new project page should be displayed again with an error message
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Name is too short (minimum is 4 characters)"
    page.text.must_include "Technologies used can't be blank"
  end
end
