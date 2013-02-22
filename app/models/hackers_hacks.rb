# == Schema Information
#
# Table name: hackers_hacks
#
#  hack_id    :integer
#  hacker_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HackersHacks < ActiveRecord::Base
  attr_accessible :hack_id, :hacker_id, :tag_list

# add tagging gem feature
acts_as_taggable
end
