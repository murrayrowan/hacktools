class RemoveUnameFromHackers < ActiveRecord::Migration
  def up
    remove_column :hackers, :uname
  end

  def down
    add_column :hackers, :uname, :string
  end
end
