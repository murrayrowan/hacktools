# == Schema Information
#
# Table name: events_hackers_hacks_teams
#
#  event_id   :integer
#  hacker_id  :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hack_id    :integer
#

class EventsHackersHacksTeams < ActiveRecord::Base
  attr_accessible :event_id, :hacker_id, :team_id, :hack_id
end
