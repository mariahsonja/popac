describe "the signin process", type: :feature do
  let!(:user) { create(:user) }

  it "signs me in" do
    visit "/"
    click_link "Sign in"

    within("#new_user") do
      fill_in "user_email",    with: user.email
      fill_in "user_password", with: user.password
    end

    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end
end
