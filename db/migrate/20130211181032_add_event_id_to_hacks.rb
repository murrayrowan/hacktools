class AddEventIdToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :event_id, :integer
  end
end
