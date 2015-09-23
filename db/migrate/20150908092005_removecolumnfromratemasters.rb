class Removecolumnfromratemasters < ActiveRecord::Migration
  def change
    remove_column :rate_masters, :rate_master_id, :integer
    add_column :item_rate_masters, :rate_master_id, :integer
  end
end
