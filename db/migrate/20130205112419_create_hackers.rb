class CreateHackers < ActiveRecord::Migration
  def change
    create_table :hackers do |t|
      t.string :uname
      t.string :fname
      t.string :lname
      t.string :city
      t.string :country
      t.string :company
      t.string :jobtitle
      t.string :twitter_id
      t.string :facebook_id
      t.date :dob

      t.timestamps
    end
  end
end
