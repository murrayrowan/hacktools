class AddHackerFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :job_title, :string
    add_column :users, :company, :string
    add_column :users, :twitter_id, :string
    add_column :users, :photo, :string
    add_column :users, :user_id, :integer
  end
end
