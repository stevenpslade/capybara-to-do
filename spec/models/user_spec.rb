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

    end

    context "a user creates lists" do

      before :all do
        @user = User.build(email: "tester2@example.com", password: "password")
        @list_one = @user.lists.create(title: "First List")
        @list_two = @user.lists.create(title: "Another List")
      end

      it "should have many lists" do
        # expect @user.lists to have 2 lists
        expect(@user.lists.size).to eql(2)
      end

    end

  end

end
