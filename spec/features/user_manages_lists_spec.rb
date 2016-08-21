require 'rails helper'

feature 'User manages lists' do

  context 'from a list' do

    before :all do
      @list = List.create(:title => 'Another To Do List')
    end

    before :each do
      @user = User.create(:email => 'stevenpslade@gmail.com', :password => 'password')
      log_in_with('stevenpslade@gmail.com', 'password')
    end

    it 'edits a list' do
    end

    it 'deletes a list' do
    end

  end

end