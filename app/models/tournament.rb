class Tournament < ActiveRecord::Base
  attr_accessible :name, :league, :start_dt, :end_dt

  validates :name, :presence => true,
            :length => {:maximum => 50}
  validates :league, :presence => true,
            :length => {:maximum => 50}

  has_many :groups, :dependent => :destroy

  def full_name
    self.league + " " + self.name
  end

  def get_start_dt
    self.start_dt.nil? ? "Not Specified" : self.start_dt
  end

  def get_end_dt
    self.end_dt.nil? ? "Not Specified" : self.end_dt
  end

  def get_groups
    Group.find_all_by_tournament_id(self.id)
  end

end
