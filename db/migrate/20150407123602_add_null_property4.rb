class AddNullProperty4 < ActiveRecord::Migration
  def change
     add_reference :attendees, :name, null: true
  end
end
