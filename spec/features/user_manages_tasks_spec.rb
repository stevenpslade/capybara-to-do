require 'rails_helper'

feature 'User can manage task' do

  context 'from a list' do

    before :all do
      @list = List.create(:title => 'Another To Do List')
      @list.tasks.create([{ :description => 'finish stuff'}, { :description => 'do things'}])
    end

    before :each do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')

      visit(list_path(@list))
    end

    it 'should have tasks' do
      
    end


  end

end