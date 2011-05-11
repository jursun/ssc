class TeamsController < ApplicationController

  # -Status-
  # A = Active
  # P = Pending
  # B = Banned

  def create
    @team = current_user.teams.build(params[:team])
    @groups = get_public_joinable_groups
    if @team.save
      flash[:success] = "You've successfully joined " + @team.group.name
      redirect_to @team.group
    else
      flash[:error] = "Could not join " + @team.group.name
      redirect_to @team.user
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      flash[:success] = @team.user.name + " has been updated!"
      redirect_to @team.group
    else
      flash[:error] = "Could not update " + @team.user.name
      redirect_to @team.group
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = @team.user.name + " was removed from " + @team.group.name
    redirect_to @team.group
  end

  private

  def get_public_joinable_groups
    Group.all(:conditions => ["private = 'F' AND id NOT IN (SELECT group_id FROM teams WHERE user_id = ?)", current_user.id])
  end

end
