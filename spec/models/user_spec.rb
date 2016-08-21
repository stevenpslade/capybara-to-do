require 'rails_helper'

RSpec.describe User, type: :model do

  describe "active record associations between user and list model" do

    context "a list is created" do

      before :all do
        @user = create(:user)
        @list = @user.lists.create(title: "First List")
      end

      it "should belong to a user" do
        # expect foreign key on @list to be user's id (4)
        expect(@list.user_id).to eql(@user.id)
      end

      it "should have many lists" do
        @list_two = @user.lists.create(title: "Another List")
        expect(@user.lists.size).to eql(2)
      end

    end

  end

end
