require 'spec_helper'

describe UsersController do

  describe 'GET User show' do

    before(:each) do
      @user = Factory(:user)
    end

    it 'should exist' do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

  end
end
