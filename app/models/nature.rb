class Nature < ActiveRecord::Base
  has_many :cash_managements, dependent: :destroy
  has_many :expense_receipts, dependent: :destroy
end
