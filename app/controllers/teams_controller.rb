class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @title = @team.name
  end

  def new
    @team = current_user.teams.build
    @groups = get_public_joinable_groups
    @title = "Create new Team"
  end

  def create
    @team = current_user.teams.build(params[:team])
    @groups = get_public_joinable_groups
    if @team.save
      flash[:success] = "New Team Created!"
      redirect_to @team
    else
      @title = "Create New Team"
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
    @title = "Edit Team"
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      flash[:success] = @team.name + " Updated!"
      redirect_to @team
    else
      @title = "Edit Team"
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    flash[:success] = @team.name + " Deleted!"
    @team.destroy
    redirect_to team_path
  end

  private

  def get_public_joinable_groups
    Group.all(:conditions => ["private = 'F' AND id NOT IN (SELECT group_id FROM teams WHERE user_id = ?)", current_user.id])
  end
  
end
