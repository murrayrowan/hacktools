class AddHackIdToEventsHackersTeams < ActiveRecord::Migration
  def change
    add_column :events_hackers_teams, :hack_id, :int
  end
end
