require 'spec_helper'

describe Team do
  before(:each) do
    @user = Factory(:user)
    @group = Factory(:group)
    @attr = {
        :name => "TSH",
        :group_id => @group.id
    }
  end

  it "should create a new instance given valid attributes" do
    @user.teams.create!(@attr)
  end

  describe "field validations" do
    it "should require a user" do
      Team.new(@attr).should_not be_valid
    end

    it "should require a team name" do
      @user.teams.build(@attr.merge(:name => "")).should_not be_valid
    end

    it "should reject team names that are too long" do
      @user.teams.build(@attr.merge(:name => "z" * 51)).should_not be_valid
    end
  end

  describe "user associations" do
    before(:each) do
      @team = @user.teams.create(@attr)
    end

    it "should have a user attribute" do
      @team.should respond_to(:user)
    end

    it "should have the right associated user" do
      @team.user_id.should == @user.id
      @team.user.should == @user
    end
  end

  describe "group associations" do
    before(:each) do
      @team = @user.teams.create(@attr)
    end

    it "should have a group attribute" do
      @team.should respond_to(:group)
    end

    it "should have the right associated group" do
      @team.group_id.should == @group.id
      @team.group.should == @group
    end
  end

end
