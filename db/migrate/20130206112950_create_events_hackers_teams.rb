class CreateEventsHackersTeams < ActiveRecord::Migration
  def change
    create_table :events_hackers_teams, :id => false do |t|
      t.integer :event_id
      t.integer :hacker_id
      t.integer :team_id

      t.timestamps
    end
  end
end
