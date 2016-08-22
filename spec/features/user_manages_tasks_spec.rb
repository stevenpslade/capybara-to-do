require 'rails_helper'

feature 'User can manage tasks' do

  context 'from a list' do

    before :all do
      @list = List.create(:title => 'Another To Do List')
      @tasks = @list.tasks.create([{ :description => 'finish stuff'}, { :description => 'do things'}])
    end

    before :each do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')

      visit(list_path(@list))
    end

    it 'can edit a task' do
      first(:link, 'Edit Task').click
      expect(page).to have_current_path(edit_polymorphic_path([@list, @tasks[0]]))

      fill_in('Description', with: 'edited task description')
      click_on('Save')

      expect(page).to have_content('edited task description')
    end

    it 'can delete a task' do
      first(:link, 'Delete Task').click
      expect(page).to have_content('Task successfully deleted.')
    end

  end

end