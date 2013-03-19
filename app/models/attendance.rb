# == Schema Information
#
# Table name: attendances
#
#  user_id    :integer
#  event_id   :integer
#  approved   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendance < ActiveRecord::Base
  attr_accessible :user_id, :event_id, :approved
  belongs_to :event
  belongs_to :user
end
