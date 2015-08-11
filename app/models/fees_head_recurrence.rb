class FeesHeadRecurrence < ActiveRecord::Base
  has_many :fees_heads, dependent: :destroy
end
