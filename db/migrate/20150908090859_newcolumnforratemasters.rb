class Newcolumnforratemasters < ActiveRecord::Migration
  def change
    add_column :rate_masters, :company_id, :integer
  end
end
