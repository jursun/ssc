require 'spec_helper'

describe Group do
  before(:each) do
    @tournament = Factory(:tournament)
    @attr = {
        :name => "TSH",
        :description => "Team SO-HI",
        :private => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    @tournament.groups.create!(@attr)
  end

  describe "field validations" do
    it "should require a tournament" do
      Group.new(@attr).should_not be_valid
    end

    it "should require a group name" do
      @tournament.groups.build(@attr.merge(:name => "")).should_not be_valid
    end

    it "should reject group names that are too long" do
      @tournament.groups.build(@attr.merge(:name => "z" * 51)).should_not be_valid
    end
  end

  describe "tournament associations" do
    before(:each) do
      @group = @tournament.groups.create(@attr)
    end

    it "should have a tournament attribute" do
      @group.should respond_to(:tournament)
    end

    it "should have the right associated tournament" do
      @group.tournament_id.should == @tournament.id
      @group.tournament.should == @tournament
    end
  end
end
