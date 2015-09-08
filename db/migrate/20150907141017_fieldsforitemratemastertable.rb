class Fieldsforitemratemastertable < ActiveRecord::Migration
  def change
    remove_column :item_rate_masters, :item_rate_master_id
    add_column :item_rate_masters, :company_id, :integer
  end
end
