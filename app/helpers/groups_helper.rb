module GroupsHelper

  def get_user(team)
    User.find_by_id(team.user_id)
  end

end
