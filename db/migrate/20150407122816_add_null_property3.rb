class AddNullProperty3 < ActiveRecord::Migration
  def change
    change_column_null :attendees, :name, true
  end
end
