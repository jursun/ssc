class Team < ActiveRecord::Base
  attr_accessible :group_id, :admin, :name

  validates :user_id, :presence => true
  validates :group_id, :presence => true
  validates :name, :presence => true,
            :length => {:maximum => 50}

  validates_each :user_id, :on => :create do |record, attr, value|
    u = value; g = record.group_id
    if u && g && Team.find_by_user_id_and_group_id(u, g)
      record.errors.add :base, 'You group already has this user'
    end
  end

  belongs_to :group
  belongs_to :user
end
