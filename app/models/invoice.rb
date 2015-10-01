class Invoice < ActiveRecord::Base
  belongs_to :stock_outward
end
