class Event < ActiveRecord::Base

  validates_presence_of :name

  has_many :attendees, :dependent => :destroy
  # 關聯宣告都可以再加上條件範圍，例如加上order指定順序
  # has_many :attendees, ->{ order("id DESC") }
  # 甚至是串連where條件
  # has_many :attendees, ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC")

  belongs_to :category

  has_many :event_groupship
  has_many :groups, :through => :event_groupship

end
