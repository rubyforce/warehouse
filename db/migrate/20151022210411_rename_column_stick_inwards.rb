class RenameColumnStickInwards < ActiveRecord::Migration
  def change
    change_column :stock_inwards, :credit, :string
  end
end
