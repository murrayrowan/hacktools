class CreateHackersHacks < ActiveRecord::Migration
  def change
    create_table :hackers_hacks, :id => false do |t|
      t.integer :hack_id
      t.integer :hacker_id

      t.timestamps
    end
  end
end
