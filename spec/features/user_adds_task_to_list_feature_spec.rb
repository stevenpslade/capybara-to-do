require 'rails_helper'

feature 'User adds a task to a list'  do
  context 'from a particular list' do

    before :all do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')

      @list = List.create(:title => 'Another To Do List')
      visit(list_path(@list))
    end

    it 'should be on a single list page' do
      expect(page).to have_current_path(list_path(@list))
    end

    it 'clicks add task to create new task' do
      click_on('Add Task')
      expect(page).to have_current_path(new_task_path)
    end

    it 'fills out info and saves task' do
      visit(new_task_path)
      fill_in('task_description', with: 'Finish rails app')
      click_on('Save')

      expect(page).to have_content('Task successfully created')
    end

  end
end