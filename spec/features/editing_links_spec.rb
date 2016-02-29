require "rails_helper"

feature "user can edit their links" do

  scenario "user can edit link from their index page" do
    login_user
    old_link = create_link

    visit root_path

    click_button "Edit"

    expect(current_path).to eq(edit_link_path(old_link))

    fill_in "link_title", with: "new title"
    fill_in "link_url", with: "https://www.google.ca"
    click_button "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("new title")
    expect(page).to have_content("https://www.google.ca")

    expect(page).to_not have_content(old_link.title)
    expect(page).to_not have_content(old_link.url)
  end

end
