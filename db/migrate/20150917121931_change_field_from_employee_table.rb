class ChangeFieldFromEmployeeTable < ActiveRecord::Migration
  def change
    remove_column :employees, :salary_rate, :string
    add_column :employees, :salary_rate, :decimal
  end
end
