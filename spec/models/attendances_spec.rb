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

require File.dirname(__FILE__) + '/../spec_helper'

describe Attendances do
  it "should be valid" do
    Attendances.new.should be_valid
  end
end
