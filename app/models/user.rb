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
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string(255)
#  status                 :string(255)      default("pending")
#  avatar                 :string(255)
#  first_name             :string(255)
#  middle_name            :string(255)
#  last_name              :string(255)
#  title                  :string(255)
#  phone                  :string(255)
#  street                 :string(255)
#  zip_code               :integer
#  city                   :string(255)
#  country                :string(255)
#  state                  :string(255)
#  short_bio              :text
#  facebook_link          :string(255)
#  twitter_link           :string(255)
#  google_plus_link       :string(255)
#  linkedin_link          :string(255)
#  social_avatar_url      :string(255)
#  latitude               :float
#  longitude              :float
#  facebook_avatar        :string(255)
#  google_plus_avatar     :string(255)
#  linkedin_avatar        :string(255)
#

class User < ActiveRecord::Base
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_password

  validates :email, :status, presence: true

  def role?(r)
    self.role.to_s == r.to_s
  end

  include Nameable
end

