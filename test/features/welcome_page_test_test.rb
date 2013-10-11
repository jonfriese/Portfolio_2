require "test_helper"

class WelcomePageTestTest < Capybara::Rails::TestCase
  scenario "Presence of welcome message" do
    visit root_path
    page.text.must_include "Welcome"
  end
end
