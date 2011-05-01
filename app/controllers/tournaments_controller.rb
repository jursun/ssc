class TournamentsController < ApplicationController
  before_filter :admin_user, :except => [:show, :index]

  def index
    @tournaments = Tournament.all
    @title = "All Tournaments"
  end

  def show
    @tournament = Tournament.find(params[:id])
    @title = @tournament.full_name
  end

  def new
    @tournament = Tournament.new
    @title = "Create New Tournament"
  end

  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      flash[:success] = "New Tournament Created!"
      redirect_to @tournament
    else
      @title = "Create New Tournament"
      render 'new'
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
    @title = "Edit Tournament"
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(params[:tournament])
      flash[:success] = @tournament.full_name + " Updated!"
      redirect_to @tournament
    else
      @title = "Edit Tournament"
      render 'edit'
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    flash[:success] = @tournament.full_name + " Deleted!"
    @tournament.destroy
    redirect_to tournaments_path
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.try(:admin?)
  end

end
