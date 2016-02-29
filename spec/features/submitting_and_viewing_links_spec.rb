require "rails_helper"

feature "submitting links" do

  scenario "authenticated user can submit links" do
    old_links_count = Link.count

    login_user

    visit root_path

    fill_in "link_title", with: "Turing"
    fill_in "link_url", with: "https://www.turing.io/"
    click_button "Create Link"

    new_links_count = Link.count

    expect(current_path).to eq(root_path)
    expect(new_links_count - old_links_count).to eq(1)
  end

  scenario "invalid link results in error message" do
    old_links_count = Link.count

    login_user

    visit root_path

    fill_in "link_title", with: "Turing"
    fill_in "link_url", with: "turing"
    click_button "Create Link"

    new_links_count = Link.count

    expect(page).to have_content("Invalid. Try again.")
    expect(old_links_count - new_links_count).to eq(0)
  end

end

feature "viewing links" do

  scenario "authenticated user can view all of their links" do
    login_user
    link = create_link

    visit root_path

    expect(page).to have_content(link.title)
    expect(page).to have_content(link.url)
    expect(page).to have_content("Status: unread")
  end

  scenario "authenticated user can't view other users links" do
    login_user
    link = create_link
    visit root_path
    click_button "Log Out"

    login_second_user
    visit root_path

    expect(page).to_not have_content(link.title)
  end

end
