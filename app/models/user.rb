class User < ActiveRecord::Base
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_password
end
