class ReceiptsFeesHead < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :fees_head

  # def total_amount
  #   fees_head.amount - concession
  # end
end
