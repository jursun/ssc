module TournamentsHelper

  def select_tournament(tournament)
    cookies[:tournament] = [tournament.id]
    self.selected_tournament = tournament
  end

  def deselect_tournament
    cookies.delete(:tournament)
    self.selected_tournament = nil
  end

  def selected_tournament=(tournament)
    @selected_tournament = tournament
  end

  def selected_tournament
    @selected_tournament ||= get_tournament
  end

  def get_tournament_id
    selected_tournament.nil? ? 0 : selected_tournament.id
  end

  def get_tournament_name
    selected_tournament.nil? ? 0 : selected_tournament.full_name
  end

  private

  def get_tournament
    Tournament.find_by_id(cookies[:tournament])
  end

end
