class Addfieldforratemasters < ActiveRecord::Migration
  def change
    add_column :rate_masters, :rate_master_id, :integer
  end
end
