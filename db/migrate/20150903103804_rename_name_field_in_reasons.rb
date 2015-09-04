class RenameNameFieldInReasons < ActiveRecord::Migration
  def change
    rename_column :reasons, :name, :item_name
  end
end
