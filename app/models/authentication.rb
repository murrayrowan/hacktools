# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid

  def provider_name
   if provider == 'open_id'
     "OpenID"
   else
     provider.titleize
   end
  end
end
