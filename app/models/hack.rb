# == Schema Information
#
# Table name: hacks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  logo        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

class Hack < ActiveRecord::Base
  attr_accessible :description, :logo, :name, :team_id, :event_id, :tag_list

# many to many relationships though join table
  has_many :hackers, :through => :hackers_hacks
  has_many :hackers_hacks

# one to many relationships
  belongs_to :team
  belongs_to :event

# add tagging gem details
acts_as_taggable

  def from_event(event_id)
   # get hacks from specific event 
  end

end
