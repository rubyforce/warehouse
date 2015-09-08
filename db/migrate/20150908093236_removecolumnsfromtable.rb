class Removecolumnsfromtable < ActiveRecord::Migration
  def change
    remove_column :item_rate_masters, :companies, :string
    remove_column :item_rate_masters, :company_id, :integer
  end
end
