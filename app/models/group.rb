class Group < ActiveRecord::Base
  attr_accessible :tournament_id, :name, :description, :private

  validates :tournament_id, :presence => true
  validates :name, :presence => true,
            :length => {:maximum => 50}

  belongs_to :tournament

  has_many :teams, :dependent => :destroy
end
