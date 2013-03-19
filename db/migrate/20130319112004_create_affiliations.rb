class CreateAffiliations < ActiveRecord::Migration
  def self.up
    create_table :affiliations, :id => false do |t|
      t.integer :user_id
      t.integer :team_id
      t.boolean :approved
      t.timestamps
    end
  end

  def self.down
    drop_table :affiliations
  end
end
