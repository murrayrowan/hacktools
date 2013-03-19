class DropEventsHackersHacksTeamsTable < ActiveRecord::Migration
  def up
    drop_table :events_hackers_hacks_teams
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
