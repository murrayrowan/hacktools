class RemoveIdFromEventsHackersTeams < ActiveRecord::Migration
  def up
    remove_column :events_hackers_teams, :id
  end

  def down
    add_column :events_hackers_teams, :id, :integer
  end
end
