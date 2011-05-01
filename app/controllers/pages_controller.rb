class PagesController < ApplicationController

  def home
    @title = "News"
  end

  def rules
    @title = "Rules"
  end

  def contact
    @title = "Contacts"
  end

  def terms
    @title = "Terms of Service"
  end

  def policy
    @title = "Private Policy"
  end
  
end
