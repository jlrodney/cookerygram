def post_hello_world
  visit '/recipes'
  click_link 'New recipe'
  fill_in 'Description', with: 'Hello, world!'
  attach_file('Image', Rails.root + 'public/Screen Shot 2018-11-01 at 15.25.58.png')
  click_button 'Create Recipe'
end

def comment_hello_aliens
  click_link 'Add Comment'
  fill_in 'comment[content]', with: 'Hello, Aliens'
  click_button 'Create Comment'
end

def sign_up
  visit '/users/sign_up'
  fill_in 'user_email', with: 'hello@world.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def user_sign_in
  visit '/users/sign_in'
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'Log in'
end
def user2_sign_in
  visit '/users/sign_in'
  fill_in 'user_email', with: @user_2.email
  fill_in 'user_password', with: @user_2.password
  click_button 'Log in'
end
