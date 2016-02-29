require "rails_helper"

feature "unauthenticated user can register" do

  scenario "user is redirected to the login/registration page from home" do
    visit root_path

    expect(current_path).to eq(login_path)
    expect(page).to have_button("Sign Up")
  end

  scenario "user can register" do
    old_user_count = User.count

    visit login_path

    click_button "Sign Up"

    expect(current_path).to eq(register_path)

    fill_in "user_email", with: "hello@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Register"

    expect(current_path).to eq(root_path)

    new_user_count = User.count

    expect(new_user_count - old_user_count).to eq(1)
  end

  scenario "user must confirm password" do
    visit login_path

    click_button "Sign Up"

    expect(current_path).to eq(register_path)

    fill_in "user_email", with: "hello@email.com"
    fill_in "user_password", with: "password"
    click_button "Register"

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Your password and password confirmation do not match. Try again.")

    fill_in "user_email", with: "hello@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "wrong password"
    click_button "Register"

    expect(current_path).to eq(register_path)
    expect(page).to have_content("Your password and password confirmation do not match. Try again.")
  end
end
