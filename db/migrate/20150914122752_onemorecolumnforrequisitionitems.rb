class Onemorecolumnforrequisitionitems < ActiveRecord::Migration
  def change
    add_column :requisition_items, :requisition_id, :integer
  end
end
