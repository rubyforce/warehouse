class ForgotAddedThatColumnToPreviousMigration < ActiveRecord::Migration
  def change
    add_column :stock_outward_items, :numeral, :integer
  end
end
