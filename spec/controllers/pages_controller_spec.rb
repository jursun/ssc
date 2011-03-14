require 'spec_helper'

describe PagesController do

  describe "get page HOME" do
    it "it should exist" do
      get 'home'
      response.should be_success
    end
  end

  describe "get page CONTACT" do
    it "it should exist" do
      get 'contact'
      response.should be_success
    end
  end

end
