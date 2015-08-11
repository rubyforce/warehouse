class FeesHeadsStandard < ActiveRecord::Base
  belongs_to :standard
  belongs_to :fees_head
end
