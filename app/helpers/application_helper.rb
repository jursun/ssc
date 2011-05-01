module ApplicationHelper

  #Generate the title
  def title
    base_title = "Survival Starcraft"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def banner
    image_tag("rails.png", :alt => "Survival Starcraft", :class => "round")
  end

  def tournament_selector
    select(:tournament, :id, Tournament.all.collect {|u| [u.full_name,u.id]}, { :include_blank => true, :selected => get_tournament_id })
  end

end
