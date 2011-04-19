class Group < ActiveRecord::Base
  attr_accessible :name, :description, :private

  validates :tournament_id, :presence => true
  validates :name, :presence => true,
            :length => {:maximum => 50}

  belongs_to :tournament
end
