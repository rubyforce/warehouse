class AddNewColumnToLedgers < ActiveRecord::Migration
  def change
    add_column :ledgers, :ac_no, :integer
  end
end
