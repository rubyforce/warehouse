class Afewcolumnsforrequisitiontable < ActiveRecord::Migration
  def change
    add_column :requisition_items, :itemName, :string
    add_column :requisition_items, :companyName, :string
    add_column :requisition_items, :warehouseName, :string
  end
end
