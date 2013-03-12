class RemoveEventIdFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :event_id
  end

  def down
    add_column :teams, :event_id, :integer
  end
end
