class PagesController < ApplicationController

  def home
    @title = "News"
  end

  def contact
    @title = "Contacts"
  end
end
