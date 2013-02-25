class RemoveHackIdFromEventsHackersHacksTeams < ActiveRecord::Migration
  def up
    remove_column :events_hackers_hacks_teams, :hack_id
  end

  def down
    add_column :events_hackers_hacks_teams, :hack_id, :int
  end
end
