feature "Check for home page" do
  scenario "Presence of welcome message" do
    visit root_path
    page.text.must_include "Hi"
  end
end
