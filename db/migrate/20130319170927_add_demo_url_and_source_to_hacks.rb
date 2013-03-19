class AddDemoUrlAndSourceToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :demo_url, :string
    add_column :hacks, :source, :string
  end
end
