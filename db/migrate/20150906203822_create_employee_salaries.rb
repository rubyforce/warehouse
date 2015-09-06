class CreateEmployeeSalaries < ActiveRecord::Migration
  def change
    create_table :employee_salaries do |t|
      t.decimal :salary_rate
      t.integer :employee_id
      t.integer :salary_id
      t.text :remark

      t.timestamps null: false
    end
  end
end
