feature "Check Style" do
  scenario "check for style" do
    visit root_path
    page.body.must_include 'bl-box'
  end
end
