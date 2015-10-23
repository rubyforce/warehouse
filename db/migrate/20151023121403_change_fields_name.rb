class ChangeFieldsName < ActiveRecord::Migration
  def change
    rename_column :stock_outwards, :amout, :amount
  end
end
