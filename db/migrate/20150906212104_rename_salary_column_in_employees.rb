class RenameSalaryColumnInEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :salary, :salary_rate
  end
end
