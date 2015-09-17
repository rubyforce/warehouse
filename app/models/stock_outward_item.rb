class StockOutwardItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :warehouse
  belongs_to :company
  belongs_to :device
end
