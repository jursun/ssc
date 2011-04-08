class Tournament < ActiveRecord::Base
  attr_accessible :name, :league, :start_dt, :end_dt

  validates :name, :presence => true,
            :length => {:maximum => 50}
  validates :league, :presence => true,
            :length => {:maximum => 50}

end
