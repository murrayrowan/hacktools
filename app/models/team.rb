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
#  photo       :string(255)
#

class Team < ActiveRecord::Base
  attr_accessible :id, :description, :logo, :name, :photo
  has_many :hackers, :through => :events_hackers_hacks_teams
  has_many :events_hackers_hacks_teams
  has_many :hacks
  belongs_to :event
end
