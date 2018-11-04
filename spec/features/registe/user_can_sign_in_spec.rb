# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign In', type: :feature do
  scenario 'User can sign in' do
    @user = create(:user)
    visit '/users/sign_in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content("Logged in as #{@user.email}")
  end
end
