# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  city                   :string(255)
#  country                :string(255)
#  job_title              :string(255)
#  company                :string(255)
#  twitter_id             :string(255)
#  photo                  :string(255)
#  type                   :string(255)
#

class User < ActiveRecord::Base
  has_many :authentications
  has_many :attendances
  has_many :events, :through => :attendances
  has_many :affiliations 
  has_many :teams, :through => :affiliations


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :photo, :city, :country, :job_title, :company, :twitter_id, :tag_list

  # attr_accessible :title, :body
  #
  def apply_omniauth(omniauth)
   authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid']) 
  end

  def password_required?
   (authentications.empty? || !password.blank?) && super
  end

# add tagging gem feature
acts_as_taggable
end
