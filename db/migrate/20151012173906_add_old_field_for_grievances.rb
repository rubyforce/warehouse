class AddOldFieldForGrievances < ActiveRecord::Migration
  def change
    add_column :grievances, :voucher_no, :string
  end
end
