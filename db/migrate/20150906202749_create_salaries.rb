class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :month
      t.string :year

      t.timestamps null: false
    end
  end
end
