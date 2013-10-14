require "test_helper"

feature "editing a project" do
  scenario "editing an existing project" do
    #Given a project
    project = Project.create(name: "test", technologies_used: "Rails")
    visit edit_project_path(project)

    #When I make changes
    fill_in "Name", with: "My Portfolio"
    click_on "Update Project"

    #Then changes will be saved
    page.text.must_have "Project was successfully updated."
    page.text.must_have "My Portfolio"
    page.text.wont_have "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an exisitng project" do
    #Given an existing project
    project = Project.create(name: "test", technologies_used: "Rails")
    visit edit_project_path(project)

    #When I submit invalid changes
    fill_in "Name", with: "Q"
    click_on "Update Project"

    #Then the changes should not be saved, and I should get a try again method
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Name is too short (minimum is 4 characters)"
    page.text.must_include "Technologies used can't be blank"
  end
end
