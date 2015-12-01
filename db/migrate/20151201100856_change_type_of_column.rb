class ChangeTypeOfColumn < ActiveRecord::Migration
  def change
    remove_column :items, :min_qty, :string
    add_column :items, :min_qty, :decimal
  end
end
