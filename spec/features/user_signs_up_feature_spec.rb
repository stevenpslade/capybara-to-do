require 'rails_helper'

feature 'User signs up' do

  context 'From the homepage' do

    it 'clicks sign up and goes to sign up page' do
      visit('/')
      click_on('Sign Up')
      expect(page).to have_current_path(new_user_registration_path)
    end

  end

  context 'Is on the sign up page' do

    it 'fills/completes sign up form' do
      visit(new_user_registration_path)
      fill_in('user_email', with: 'tester@example.com')
      fill_in('user_password', with: 'password')
      fill_in('user_password_confirmation', with: 'password')
      click_on('Sign up')
      expect(page).to have_current_path('/')
      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_content('Log out')
    end

  end

end