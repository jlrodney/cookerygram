require 'rails_helper'

RSpec.feature 'Feature Tests - recipes', type: :feature do
  before(:each) do
    @user = create(:user)
  end
  scenario 'Can submit recipes and view them' do
    visit '/'
    user_sign_in
    click_link 'New recipe'
    fill_in 'Description', with: "This is a description"
    attach_file('Image', Rails.root + 'public/Screen Shot 2018-11-01 at 15.25.58.png')
    click_button 'Create Recipe'
    expect(page).to have_content('This is a description')
    expect(page).to have_content(@user.user_name)
  end

  scenario 'error message when upload unsuccessful' do
    visit '/'
    user_sign_in
    click_link 'New recipe'
    fill_in 'Description', with: "This is a description"
    click_button 'Create Recipe'
    expect(page).to have_content("Upload failed")
    expect(current_path).to eq('/recipes')
  end

  scenario 'Can submit posts and edit them' do
    visit '/'
    user_sign_in
    post_hello_world
    click_link 'Edit Recipe'
    fill_in 'Description', with: "Goodbye world"
    click_button 'Update Recipe'
    expect(page).to have_content('Goodbye world')
  end

  scenario 'Can delete posts and see flash confirmation' do
    visit '/'
    user_sign_in
    post_hello_world
    click_link 'Delete'
    expect(page).to_not have_content('Goodbye world')
    expect(page).to have_content('Recipe deleted')
  end


  scenario "Cannot update other user's posts" do
    @user_2 = create(:user_2)
    visit '/'
    user_sign_in
    post_hello_world
    click_link 'Logout'
    visit '/'
    user2_sign_in
    visit '/recipes'
    expect(page.find_by_id('recipe_1')).to have_no_link('Edit')
  end

  scenario "Cannot update other user's posts" do
    @user_2 = create(:user_2)
    visit '/'
    user_sign_in
    post_hello_world
    click_link 'Edit Recipe'
    attach_file('Image', Rails.root + 'public/apple-touch-icon.png')
    click_button 'Update Recipe'
    expect(page).to have_content("Update failed")
    expect(current_path).to eq('/recipes/1')
  end

  scenario "Cannot delete other user's posts" do
    @user_2 = create(:user_2)
    visit '/'
    user_sign_in
    post_hello_world
    click_link 'Logout'
    visit '/'
    user2_sign_in
    visit '/recipes'
    expect(page.find_by_id('recipe_1')).to have_no_link('Delete')
  end
end
