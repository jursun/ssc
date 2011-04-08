require 'spec_helper'

describe PagesController do

  describe "GET Page home" do
    it "it should exist" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET Page rules" do
    it "it should exist" do
      get 'rules'
      response.should be_success
    end
  end

  describe "GET Page contact" do
    it "it should exist" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET Page terms" do
    it "it should exist" do
      get 'terms'
      response.should be_success
    end
  end

  describe "GET Page policy" do
    it "it should exist" do
      get 'policy'
      response.should be_success
    end
  end

end
