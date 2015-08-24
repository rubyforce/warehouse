class PaymentVoucher < ActiveRecord::Base
  belongs_to :ledger, class_name: "Ledger", foreign_key: "ledger_id" 
end
