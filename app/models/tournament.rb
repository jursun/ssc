class Tournament < ActiveRecord::Base
  attr_accessible :name, :league, :start_dt, :end_dt

  validates :name, :presence => true,
            :length => {:maximum => 50}
  validates :league, :presence => true,
            :length => {:maximum => 50}

  def get_start_dt
    return "Not Specified" if self.start_dt.nil?
    return self.start_dt
  end

  def get_end_dt
    return "Not Specified" if self.end_dt.nil?
    return self.end_dt
  end
end
