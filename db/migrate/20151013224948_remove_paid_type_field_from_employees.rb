class RemovePaidTypeFieldFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :paid_type, :string
  end
end
