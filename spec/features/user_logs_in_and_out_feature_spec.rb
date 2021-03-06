require 'rails_helper'

feature 'User logs in and out' do

  describe 'log in process' do
    context 'from the home page' do

      it 'should click log in' do
        visit('/')
        click_on('Log in')
        expect(page).to have_current_path(user_session_path)
      end

      it 'should complete log in fields' do
        user = User.create(:email    => "stevenpslade@gmail.com", :password => "password")

        log_in_with('stevenpslade@gmail.com', 'password')

        expect(page).to have_current_path('/')
        expect(page).to have_content('Signed in successfully.')
      end

    end
  end

  describe 'log out process' do
    context 'User is logged in on the home page' do

      before :all do
        user = User.create(:email    => "stevenpslade@gmail.com", :password => "password")
        log_in_with('stevenpslade@gmail.com', 'password')
      end

      it 'should log out' do
        expect(page).to have_content('Log out')
        click_on('Log out')
        expect(page).to have_content('Signed out successfully')
      end

    end
  end
  
end