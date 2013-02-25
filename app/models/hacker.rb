# == Schema Information
#
# Table name: hackers
#
#  id          :integer          not null, primary key
#  uname       :string(255)
#  fname       :string(255)
#  lname       :string(255)
#  city        :string(255)
#  country     :string(255)
#  company     :string(255)
#  jobtitle    :string(255)
#  twitter_id  :string(255)
#  facebook_id :string(255)
#  dob         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

class Hacker < ActiveRecord::Base
  attr_accessible :city, :company, :country, :dob, :fname, :jobtitle, :lname, :twitter_id, :tag_list

# many to many relationships through join tables
  has_many :events_hackers_hacks_teams
  has_many :hacks, :through => :events_hackers_hacks_teams 
  has_many :events, :through => :events_hackers_hacks_teams 
  has_many :teams, :through => :events_hackers_hacks_teams 

# add tagging gem feature
acts_as_taggable

end
