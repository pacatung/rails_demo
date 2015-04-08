class AddColumnAttendeeNameNotNull < ActiveRecord::Migration
  def change
    add_column :attendees, :name, :string, :null => false, :default => "default"
  end
end
