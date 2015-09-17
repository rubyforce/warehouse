class AddNewColumnsForStockinTable < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :amount_paid, :boolean, :default => false
  end
end
