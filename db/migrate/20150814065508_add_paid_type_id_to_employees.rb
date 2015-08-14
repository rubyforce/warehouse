class AddPaidTypeIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :paid_type_id, :integer
  end
end
