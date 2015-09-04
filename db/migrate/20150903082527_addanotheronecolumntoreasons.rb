class Addanotheronecolumntoreasons < ActiveRecord::Migration
  def change
    add_column :reasons, :grievance_id, :integer
    add_column :reasons, :numeral, :integer
  end
end
