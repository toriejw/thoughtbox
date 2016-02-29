require "rails_helper"

feature "submitting links" do

  scenario "authenticated user can submit links" do
    # I should see a simple form to submit a link.
    old_links_count = Link.count

    login_user

    visit root_path

    fill_in "link_title", with: "Turing"
    fill_in "link_url", with: "https://www.turing.io/"
    click_button "Create Link"

    new_links_count = Link.count

    expect(current_path).to eq(root_path)
    expect(new_links_count - old_links_count).to eq(1)
    # The Link model should include:
    #
    # A valid URL location for the link
    # A title for the link
    # Additionally, all links have a read status that is either true or false. This column will default to false.

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
    # loading the index page should display all of my links
    login_user
    visit root_path
  end

  # scenario "authenticated user views only their links" do
  #   login_user
  #   visit root_path
  # end

end
