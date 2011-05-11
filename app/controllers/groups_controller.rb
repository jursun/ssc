class GroupsController < ApplicationController
  before_filter :admin_user, :only => [:edit, :update, :destroy]
  before_filter :group_admin, :only => [:edit, :update, :destroy]

  def index
    @groups = get_public_groups
    @title = "All Public Groups"
  end

  def show
    @group = Group.find(params[:id])
    @title = @group.name
    @teams = @group.get_teams
  end

  def new
    @group = Group.new
    @tournaments = get_joinable_tournaments
    @title = "Create new Group"
  end

  def create
    @group = Group.new(params[:group])
    @tournaments = get_joinable_tournaments
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

  private

  def get_public_groups
    if selected_tournament.nil?
      Group.find_all_by_private('F')
    else
      Group.find_all_by_private_and_tournament_id('F', selected_tournament.id)
    end
  end

  def get_joinable_tournaments
    Tournament.all
    #Tournament.all(:conditions => ['start_dt >= ?', Date.today])
  end

  def get_tournaments_in_progress
    Tournament.all(:conditions => ['? BETWEEN start_dt AND end_dt', Date.today])
  end

  def get_past_tournaments
    Tournament.all(:conditions => ['end_dt < ?', Date.today])
  end

  def admin_user
    redirect_to(group_path) unless current_user.try(:admin?)
  end

  def group_admin
    redirect_to(group_path) unless get_team.admin?
  end

  def get_team
    Team.find_by_user_id_and_group_id(current_user.try(:id), params[:id])
  end

end
