
require 'rails_helper'

RSpec.feature 'Comments feature test', type: :feature do
  before(:each) do
    @user = create(:user)
  end
  scenario 'Can fill in form' do
    user_sign_in
    post_hello_world
    comment_hello_aliens
    expect(current_path).to eq('/recipes')
    expect(page).to have_content('Hello, Aliens')
  end

  scenario 'should find a back to posts link' do
    user_sign_in
    post_hello_world
    click_link 'Add Comment'
    expect(page).to have_link("Back")
  end

  scenario 'Comment author displayed next to their comment' do
    user_sign_in
    post_hello_world
    comment_hello_aliens
    expect(current_path).to eq('/recipes')
    expect(page.find_by_id('comment_1')).to have_content(@user.user_name)
  end
end
