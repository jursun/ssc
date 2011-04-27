class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "All Users"
  end

  def show
    @user = User.find(params[:id])
    @teams = Team.find(:all, :conditions => ['user_id = ?', @user.id])
    @title = @user.username
  end
end
