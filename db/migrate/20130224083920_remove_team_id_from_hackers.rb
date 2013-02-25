class RemoveTeamIdFromHackers < ActiveRecord::Migration
  def up
    remove_column :hackers, :team_id
  end

  def down
    add_column :hackers, :team_id, :int
  end
end
