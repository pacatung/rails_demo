class Group < ActiveRecord::Base
  has_many :event_groupship
  has_many :events, :through => :event_groupship
end
