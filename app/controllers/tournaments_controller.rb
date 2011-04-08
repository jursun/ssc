class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
    @title = "All Tournaments"
  end

  def show
    @tournament = Tournament.find(params[:id])
    @title = @tournament.league + " - " + @tournament.name
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
      flash[:success] = @tournament.league + " - " + @tournament.name + " Updated!"
      redirect_to @tournament
    else
      @title = "Edit Tournament"
      render 'edit'
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    flash[:success] = @tournament.league + " - " + @tournament.name + " Deleted!"
    @tournament.destroy
    redirect_to tournaments_path
  end
end
