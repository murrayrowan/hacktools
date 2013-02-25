class RenameEventsHackersTeamsTable < ActiveRecord::Migration
  def up
    rename_table :events_hackers_teams, :events_hackers_hacks_teams
  end

  def down
    rename_table :events_hackers_hacks_teams, :events_hackers_teams
  end
end
