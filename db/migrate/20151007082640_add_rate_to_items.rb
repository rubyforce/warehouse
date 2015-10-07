class AddRateToItems < ActiveRecord::Migration
  def change
    add_column :items, :rate, :float
  end
end
