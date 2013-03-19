class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances, :id => false do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :approved
      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
