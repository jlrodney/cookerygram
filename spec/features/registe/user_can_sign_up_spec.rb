# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'Can sign up' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'hello@world.com'
    fill_in 'User name', with: 'Hello'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content(
      'You have signed up successfully.')
  end

end
