# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  logo        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  attr_accessible :description, :logo, :name, :event_id
  has_many :hackers, :through => :hackers_teams_events
  has_many :events_hackers_teams
  has_many :hacks
  belongs_to :event
end
