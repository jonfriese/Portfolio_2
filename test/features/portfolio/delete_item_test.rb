require "test_helper"

def author_project

  sign_in(:author)

  visit projects_path
  click_on "New Project"
  fill_in "Name", with: "Gary Payton"
  fill_in "Technologies used", with: "Is da best!!"
  click_on "Create Project"

  project_id = current_url.split('/').last
end

feature "Deleting a project" do
  scenario "editor can delete a project" do

    sign_in

    visit projects_path

    click_link('Destroy', href: "/projects/#{projects(:one).id}")


    page.wont_have_content "chickens"
  end

  scenario "an author can delete their own project" do

    project_id = author_project

    click_on "Back"
    click_link("Destroy", href: "/projects/#{project_id}")

    page.wont_have_content "Gary Payton"
  end
end
