class CreateEventGroupships < ActiveRecord::Migration
  def change
    create_table :event_groupships do |t|
      t.integer :event_id
      t.integer :group_id

      t.timestamps
    end

    add_index :event_id
    add_index :group_id
  end
end
