class Addanotheronecolumntoreasons < ActiveRecord::Migration
  def change
    add_column :reasons, :grievance_id, :integer
  end
end
