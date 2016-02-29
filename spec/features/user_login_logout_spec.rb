require "rails_helper"

feature "registered user can log in and out" do

  def create_user
    User.create(email: "hello@email.com", password: "password")
  end

  def login_user
    user = create_user
    visit login_path

    fill_in "session_email", with: "hello@email.com"
    fill_in "session_password", with: "password"

    click_button "Log In"
  end

  scenario "registered user can log in" do
    create_user

    visit login_path

    fill_in "session_email", with: "hello@email.com"
    fill_in "session_password", with: "password"

    click_button "Log In"
  end

  scenario "registered user can log out" do
    login_user

    visit root_path

    click_button "Log Out"

    expect(current_path).to eq(login_path)

    visit root_path

    expect(current_path).to eq(login_path) # if cookies are cleared then this is where root path will take user
  end

end
