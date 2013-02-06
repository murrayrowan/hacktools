class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.string :logo
      t.string :owner
      t.string :venue
      t.string :street_address
      t.string :city
      t.string :zipcode
      t.string :email
      t.string :twitter_id
      t.string :facebook_id
      t.string :url

      t.timestamps
    end
  end
end
