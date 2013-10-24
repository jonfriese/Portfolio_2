require "test_helper"

feature "Display my portfolio" do
  scenario "viewing projects" do

    visit projects_path
    page.text.must_include projects(:one).name
  end
end
