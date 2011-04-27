module UsersHelper

  def get_group(team)
    Group.find_by_id(team.group_id)
  end
  
end
