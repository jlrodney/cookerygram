# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


def user_sign_in
  @user = build(:user)
  visit '/users/sign_in'
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'Log in'
end
