class RemoveColumnAttendeeName < ActiveRecord::Migration
  def change
    remove_column :attendees, :name
  end
end
