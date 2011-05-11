class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "All Users"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.username
    @teams = get_user_groups_by_tournament
    @team = @user.teams.build
    @groups = get_private_joinable_groups
  end

  private

  def get_user_groups_by_tournament
    if selected_tournament.nil?
      @user.get_teams
    else
      Team.all(:conditions => ["group_id IN (SELECT id FROM groups WHERE tournament_id = ?) AND user_id = ?", selected_tournament.id, @user.id])
    end
  end

  def get_private_joinable_groups
    if selected_tournament.nil?
      Group.all(:conditions => ["private = 'T' AND id NOT IN (SELECT group_id FROM teams WHERE user_id = ?)", @user.id])
    else
      Group.all(:conditions => ["private = 'T' AND tournament_id = ? AND id NOT IN (SELECT group_id FROM teams WHERE user_id = ?)", selected_tournament.id, @user.id])
    end
  end

end
