# == Schema Information
#
# Table name: affiliations
#
#  user_id    :integer
#  team_id    :integer
#  approved   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Affiliation < ActiveRecord::Base
  attr_accessible :user_id, :team_id, :approved
  belongs_to :team
  belongs_to :user
end
	