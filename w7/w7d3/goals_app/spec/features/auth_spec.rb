require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
      visit new_user_path # => '/users/new'
  end

  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
  end

  scenario 'shows username on the page after signup' do 
    expect(page).to have_content(user.username) 
  end
  
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end