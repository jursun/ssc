require 'spec_helper'

describe Tournament do

  before(:each) do
    @attr = {
        :name => "Mar. (2011)",
        :league => "GSL"
    }
  end

  it "should create a new instance given valid attributes" do
    Tournament.create!(@attr)
  end

  describe "name and league validation" do
    it "should require a tournament name" do
      no_name_tournament = User.new(@attr.merge(:name => ""))
      no_name_tournament.should_not be_valid
    end

    it "should reject tournament names that are too long" do
      long_name = "z" * 51
      long_name_tournament = User.new(@attr.merge(:name => long_name))
      long_name_tournament.should_not be_valid
    end

    it "should require a league name" do
      no_league_tournament = Tournament.new(@attr.merge(:league => ""))
      no_league_tournament.should_not be_valid
    end

    it "should reject league names that are too long" do
      long_name = "z" * 51
      long_name_tournament = User.new(@attr.merge(:league => long_name))
      long_name_tournament.should_not be_valid
    end

  end

end
