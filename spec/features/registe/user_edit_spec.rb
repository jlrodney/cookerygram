require 'rails_helper'

RSpec.feature 'Sign In', type: :feature do
  scenario 'User can sign in' do
    @user = create(:user)
    visit '/users/sign_in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    click_link 'Edit profile'
    fill_in 'Password', with: "hellop"
    fill_in 'Password confirmation', with: "hellop"
    fill_in 'Current password', with: @user.password
    click_button 'Update'
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
