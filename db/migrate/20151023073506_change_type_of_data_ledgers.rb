class ChangeTypeOfDataLedgers < ActiveRecord::Migration
  def change
    change_column :ledgers, :ac_no, :string
  end
end
