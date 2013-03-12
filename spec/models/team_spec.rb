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
#  event_id    :integer
#  photo       :string(255)
#

require 'spec_helper'

describe Team do
  pending "add some examples to (or delete) #{__FILE__}"
end
