class Columnforitemratemastertable < ActiveRecord::Migration
  def change
    add_column :item_rate_masters, :name, :string
  end
end
