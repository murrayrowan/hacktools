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

require 'spec_helper'

describe Hack do
  pending "add some examples to (or delete) #{__FILE__}"
end
