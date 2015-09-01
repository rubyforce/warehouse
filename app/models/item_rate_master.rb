class ItemRateMaster < ActiveRecord::Base
  belongs_to :item
  belongs_to :rate_master
end
