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

class Event < ActiveRecord::Base
  attr_accessible :city, :description, :email, :facebook_id, :logo, :name, :owner, :street_address, :time, :twitter_id, :url, :venue, :zipcode, :country, :tag_list
    has_many :events_hackers
    has_many :hackers, :through => :events_hackers_hacks_teams
    has_many :hacks, :through => :events_hackers_hacks_teams
    has_many :teams, :through => :events_hackers_hacks_teams

# add tagging gem feature
acts_as_taggable

end
