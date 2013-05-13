class AddIdToAffiliations < ActiveRecord::Migration
  def change
    add_column :affiliations, :id, :primary_key
  end
end
