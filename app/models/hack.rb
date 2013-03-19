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
#  event_id    :integer
#

class Hack < ActiveRecord::Base
  attr_accessible :id, :description, :logo, :name, :team_id, :event_id, :tag_list

# one to many relationships
  belongs_to :team

# add tagging gem details
acts_as_taggable

end
