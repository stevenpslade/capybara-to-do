require 'rails_helper'

feature 'User creates a list'  do
  
  context 'from the home page' do

    before :all do
      user = User.create(:email    => "stevenpslade@gmail.com", :password => "password")
      log_in_with('stevenpslade@gmail.com', 'password')
    end

    it 'clicks to add a new list' do
      click_on('Add List')
      expect(page).to have_current_path(new_list_path)
    end

    it 'fills out list info and saves it' do
      visit(new_list_path)
      fill_in('list_name', with: 'Another To Do List')
      click_on('Save')
      expect(page).to have_current_path(show_list_path)
    end

  end

end