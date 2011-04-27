class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @title = "All Groups"
  end

  def show
    @group = Group.find(params[:id])
    @title = @group.name
    @teams = Team.all(:conditions => ['group_id = ?', @group.id])
  end

  def new
    @group = Group.new
    #Testing Code
    @tournaments = Tournament.all
#    @tournaments = get_joinable_tournaments
    @title = "Create new Group"
  end

  def create
    @group = Group.new(params[:group])
    @tournaments = Tournament.all
#    @tournaments = get_joinable_tournaments
    if @group.save
      flash[:success] = "New Group Created!"
      redirect_to @group
    else
      @title = "Create New Group"
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
    @title = "Edit Group"
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:success] = @group.name + " Updated!"
      redirect_to @group
    else
      @title = "Edit Group"
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    flash[:success] = @group.name + " Deleted!"
    @group.destroy
    redirect_to group_path
  end

  def get_joinable_tournaments
    Tournament.all(:conditions => ['start_dt >= ?', Date.today])
  end

  def get_tournaments_in_progress
    Tournament.all(:conditions => ['? BETWEEN start_dt AND end_dt', Date.today])
  end

  def get_past_tournaments
    Tournament.all(:conditions => ['end_dt < ?', Date.today])
  end
  
end
