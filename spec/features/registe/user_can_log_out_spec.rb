# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Logout', type: :feature do
   scenario 'User can Logout' do
    @user = create(:user)
    visit '/users/sign_in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    click_on 'Logout'
    expect(page).to have_content(
      'You need to sign in or sign up before continuing.')
  end
end
