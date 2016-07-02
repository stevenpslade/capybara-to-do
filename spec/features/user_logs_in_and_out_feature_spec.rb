require 'rails_helper'

feature 'User logs in' do

  context 'from the home page' do

    it 'should click log in' do
      visit('/')
      click_on('Log in')
      expect(page).to have_current_path(user_session_path)
    end

    it 'should complete log in fields' do
      visit(user_session_path)
      fill_in('user_email', with: 'stevenpslade@gmail.com')
      fill_in('user_password', with: 'password')
      click_on('Log in')
      expect(page).to have_current_path('/')
      expect(page).to have_content('You are signed in.')
    end

  end
  
end