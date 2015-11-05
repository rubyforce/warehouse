class Changetypeofdiscount < ActiveRecord::Migration
  def change
    change_column :stock_outwards, :discount, 'decimal USING CAST(discount AS decimal)'
  end
end
