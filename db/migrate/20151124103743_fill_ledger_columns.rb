class FillLedgerColumns < ActiveRecord::Migration
  def change
    StockOutward.all.each do |stock_outward|
      stock_outward.ledger_name = stock_outward.stock_outward_items.first.try(:ledger_name)
      stock_outward.contact_no = stock_outward.stock_outward_items.first.try(:contact_no)
      stock_outward.ledger_id = stock_outward.stock_outward_items.first.try(:ledger_id)
      stock_outward.warehouse_name = stock_outward.stock_outward_items.first.try(:warehouse_name)
      stock_outward.warehouse_id = stock_outward.stock_outward_items.first.try(:warehouse_id)
    end
  end
end
