require 'rails_helper'

feature 'User logs in' do

  context 'from the home page' do

    it 'should click log in' do
      visit('/')
      click_on('Log in')
      expect(page).to have_current_path(user_session_path)
    end

    it 'should complete log in fields' do
      user = User.create(:email    => "stevenpslade@gmail.com", :password => "password")

      visit(user_session_path)

      within('#new_user') do
        fill_in('Email', with: 'stevenpslade@gmail.com')
        fill_in('Password', with: 'password')
      end

      click_on('Log in')
      expect(page).to have_current_path('/')
      expect(page).to have_content('Signed in successfully.')
    end

  end
  
end