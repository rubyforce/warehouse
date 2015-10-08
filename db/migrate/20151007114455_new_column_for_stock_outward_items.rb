class NewColumnForStockOutwardItems < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :contact_no, :string
  end
end
