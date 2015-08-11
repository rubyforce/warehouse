# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  provider   :string(255)      not null
#  uid        :string(255)      not null
#  email      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  auth_token :string(255)
#

class Authentication < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :email, :user_id, presence: true

  def self.find_user_by_auth(auth)
    authentication = where(provider: auth.provider).
                     where(uid: auth.uid).
                     where(email: auth.info['email']).
                     first
    authentication.try(:user)
  end
end

