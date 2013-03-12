# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  time           :time
#  logo           :string(255)
#  owner          :string(255)
#  venue          :string(255)
#  street_address :string(255)
#  city           :string(255)
#  zipcode        :string(255)
#  email          :string(255)
#  twitter_id     :string(255)
#  facebook_id    :string(255)
#  url            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  country        :string(255)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
