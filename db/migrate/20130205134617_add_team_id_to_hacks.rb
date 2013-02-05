class AddTeamIdToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :team_id, :integer
  end
end
