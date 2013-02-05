class Hack < ActiveRecord::Base
  attr_accessible :description, :logo, :name, :team_id
  has_many :hackers
  belongs_to :team
end
