class AddHackIdToEventsHackersHacksTeams < ActiveRecord::Migration
  def change
    add_column :events_hackers_hacks_teams, :hack_id, :integer
  end
end
