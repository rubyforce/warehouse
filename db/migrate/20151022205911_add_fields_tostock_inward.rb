class AddFieldsTostockInward < ActiveRecord::Migration
  def change
    add_column :stock_inwards, :cash, :decimal
    add_column :stock_inwards, :credit, :integer
  end
end
