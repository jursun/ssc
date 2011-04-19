class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @title = "All Groups"
  end

  def show
    @group = Group.find(params[:id])
    @title = @group.name
  end

  def new
    @group = Group.new
    #Testing Code
    @tournaments = Tournament.all
#    @tournaments = Tournament.find(:all, :conditions => ['start_dt >= ?', Date.today])
    @title = "Create new Group"
  end

  def create
    @group = Group.new(params[:group])
    @tournaments = Tournament.all
#    @tournaments = Tournament.find(:all, :conditions => ['start_dt >= ?', Date.today])
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

end
