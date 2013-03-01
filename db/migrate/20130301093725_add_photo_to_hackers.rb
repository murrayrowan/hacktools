class AddPhotoToHackers < ActiveRecord::Migration
  def change
    add_column :hackers, :photo, :string
  end
end
