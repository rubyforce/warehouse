class AddItemNameFieldToVehicleLoadingItems < ActiveRecord::Migration
  def change
    add_column :vehicle_loading_items, :item_name, :string
  end
end
