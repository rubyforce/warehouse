class Myfaultwithcolumns < ActiveRecord::Migration
  def change
    remove_column :requisition_items, :itemName, :string
    remove_column :requisition_items, :companyName, :string
    remove_column :requisition_items, :warehouseName, :string

    add_column :requisition_items, :item_name, :string
    add_column :requisition_items, :company_name, :string
    add_column :requisition_items, :warehouse_name, :string
  end
end
