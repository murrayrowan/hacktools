# == Schema Information
#
# Table name: hackers
#
#  id          :integer          not null, primary key
#  uname       :string(255)
#  fname       :string(255)
#  lname       :string(255)
#  city        :string(255)
#  country     :string(255)
#  company     :string(255)
#  jobtitle    :string(255)
#  twitter_id  :string(255)
#  facebook_id :string(255)
#  dob         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

require 'spec_helper'

describe Hacker do
  pending "add some examples to (or delete) #{__FILE__}"
end
