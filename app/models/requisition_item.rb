class RequisitionItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :warehouse
  belongs_to :company
end
