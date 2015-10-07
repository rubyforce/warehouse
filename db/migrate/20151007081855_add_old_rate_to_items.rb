class AddOldRateToItems < ActiveRecord::Migration
  def change
    add_column :items, :old_rate, :float
  end
end
