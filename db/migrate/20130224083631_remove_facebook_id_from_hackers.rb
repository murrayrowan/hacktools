class RemoveFacebookIdFromHackers < ActiveRecord::Migration
  def up
    remove_column :hackers, :facebook_id
  end

  def down
    add_column :hackers, :facebook_id, :string
  end
end
