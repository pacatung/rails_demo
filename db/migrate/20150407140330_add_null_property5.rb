class AddNullProperty5 < ActiveRecord::Migration
  def change
    # change_column_null :attendees, :name

    has_many :event_groupship
    has_many :groups, :through => :event_groupship
  end
end
