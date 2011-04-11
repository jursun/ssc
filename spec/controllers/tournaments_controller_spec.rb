require 'spec_helper'

describe TournamentsController do

  describe "GET 'index'" do
    it "should exist" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @tournament = Factory(:tournament)
    end

    it "should exist" do
      get :show, :id => @tournament
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @tournament
      assigns(:tournament).should == @tournament
    end
  end

  describe "GET 'new'" do
    it "should exist" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = {:name => "", :league => "", :start_dt => "", :end_dt => ""}
      end

      it "should not create a tournament" do
        lambda do
          post :create, :tournament => @attr
        end.should_not change(Tournament, :count)
      end

      it "should render the 'new' page" do
        post :create, :tournament => @attr
        response.should render_template('new')
      end
    end

    describe "success" do
      before(:each) do
        @attr = {:name => "Mar. (2011)", :league => "GSL", :start_dt => "2011-02-21", :end_dt => "2011-03-19"}
      end

      it "should create a tournament" do
        lambda do
          post :create, :tournament => @attr
        end.should change(Tournament, :count).by(1)
      end

      it "should redirect to the tournament show page" do
        post :create, :tournament => @attr
        response.should redirect_to(tournament_path(assigns(:tournament)))
      end

      it "should have a success message" do
        post :create, :tournament => @attr
        flash[:success].should =~ /New Tournament Created!/
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @tournament = Factory(:tournament)
    end

    it "should exist" do
      get :edit, :id => @tournament
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @tournament = Factory(:tournament)
    end

    describe "failure" do
      before(:each) do
        @attr = {:name => "", :league => "", :start_dt => "", :end_dt => ""}
      end

      it "should render the 'edit' page" do
        put :update, :id => @tournament, :tournament => @attr
        response.should render_template('edit')
      end
    end

    describe "success" do
      before(:each) do
        @attr = {:name => "Season 1", :league => "NASAL", :start_dt => "2011-04-12", :end_dt => ""}
      end

      it "should change the tournament's attributes" do
        put :update, :id => @tournament, :tournament => @attr
        @tournament.reload
        @tournament.name.should == @attr[:name]
        @tournament.league.should == @attr[:league]
        @tournament.start_dt.should == @attr[:start_dt].to_date
        @tournament.end_dt.should be_nil
      end

      it "should redirect to the tournament show page" do
        put :update, :id => @tournament, :tournament => @attr
        response.should redirect_to(tournament_path(@tournament))
      end

      it "should have a flash message" do
        put :update, :id => @tournament, :tournament => @attr
        flash[:success].should =~ /Updated!/
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @tournament = Factory(:tournament)
    end

    it "should destroy the tournament" do
      lambda do
        delete :destroy, :id => @tournament
      end.should change(Tournament, :count).by(-1)
    end

    it "should redirect to the tournament page" do
      delete :destroy, :id => @tournament
      response.should redirect_to(tournaments_path)
    end
  end
end