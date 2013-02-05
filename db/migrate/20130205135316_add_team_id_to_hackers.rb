class AddTeamIdToHackers < ActiveRecord::Migration
  def change
    add_column :hackers, :team_id, :integer
  end
end
