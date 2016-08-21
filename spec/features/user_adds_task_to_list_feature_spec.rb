require 'rails_helper'

feature 'User adds a task to a list'  do
  context 'from a particular list' do

    before :each do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')

      @list = List.create(:title => 'Another To Do List')
    end

    it 'should be on a single list page' do
      visit(list_path(@list))
      expect(page).to have_current_path(list_path(@list))
    end

    it 'clicks add task to create new task' do
      visit(list_path(@list))
      click_on('Add Task')
      expect(page).to have_current_path(new_list_task_path(@list))
    end

    it 'fills out info and saves task' do
      visit(new_list_task_path(@list))
      fill_in('task_description', with: 'Finish rails app')
      click_on('Save')

      expect(page).to have_content('Task successfully created')
    end

  end
end