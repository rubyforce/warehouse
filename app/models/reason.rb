class Reason < ActiveRecord::Base
  belongs_to :item, class_name: "Item", foreign_key: "item_id"
  belongs_to :reason
end
