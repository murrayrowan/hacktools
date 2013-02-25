class DropHackersHacksTable < ActiveRecord::Migration
  def up
   drop_table :hackers_hacks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
