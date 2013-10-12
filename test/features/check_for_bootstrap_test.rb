require "test_helper"

feature "CheckForBootstrap" do
  scenario "check for bootstrap" do
    visit root_path
    page.body.must_include 'bootstrap'
  end
end
