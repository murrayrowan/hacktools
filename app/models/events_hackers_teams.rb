# == Schema Information
#
# Table name: events_hackers_teams
#
#  event_id   :integer
#  hacker_id  :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventsHackersTeams < ActiveRecord::Base
  attr_accessible :event_id, :hacker_id, :team_id
end
