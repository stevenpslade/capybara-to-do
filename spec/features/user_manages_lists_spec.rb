require 'rails_helper'

feature 'User manages lists' do

  context 'from a list' do

    before :all do
      @list = List.create(:title => 'Another To Do List')
    end

    before :each do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')

      visit(list_path(@list))
    end

    it 'edits a list' do
      click_on('Edit List')
      expect(page).to have_current_path(edit_list_path(@list))

      fill_in('list_title', with: 'Edited List Title')
      click_on('Save')

      expect(page).to have_content('Edited List Title')
    end

    it 'deletes a list' do
      click_on('Delete List')
      expect(page).to have_content('List successfully deleted.')
    end

  end

end