class Hacker < ActiveRecord::Base
  attr_accessible :city, :company, :country, :dob, :facebook_id, :fname, :jobtitle, :lname, :twitter_id, :uname, :team_id
  has_many :hacks
  belongs_to :team
end
