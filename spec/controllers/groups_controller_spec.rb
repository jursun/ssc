require 'spec_helper'

describe GroupsController do

  describe "GET 'index'" do
    it "should exist" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @group = Factory(:group)
    end

    it "should exist" do
      get :show, :id => @group
      response.should be_success
    end

    it "should find the right group" do
      get :show, :id => @group
      assigns(:group).should == @group
    end
  end

  describe "GET 'new'" do
    it "should exist" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    pending
  end

  describe "GET 'edit'" do
    pending
  end

  describe "PUT 'update'" do
    pending
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @group = Factory(:group)
    end

    it "should destroy the group" do
      lambda do
        delete :destroy, :id => @group
      end.should change(Group, :count).by(-1)
    end
  end
end
