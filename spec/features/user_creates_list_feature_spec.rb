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
      fill_in('list_title', with: 'Another To Do List')
      click_on('Save')
      # unsure if in test environment this list will always be
      # list with id 1 but working for now, will start using
      # factory girl if needed
      expect(page).to have_current_path(list_path(1))
    end

  end

end