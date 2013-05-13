class AddIdToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :id, :primary_key
  end
end
