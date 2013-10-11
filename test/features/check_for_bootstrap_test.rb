require "test_helper"

feature "CheckForBootstrap" do
  scenario "chcek for bootstrap" do
    visit root_path
    page.body.must_match /col-/
  end
end
