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

require File.dirname(__FILE__) + '/../spec_helper'

describe Affiliations do
  it "should be valid" do
    Affiliations.new.should be_valid
  end
end
