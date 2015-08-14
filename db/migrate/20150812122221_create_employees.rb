class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date   :birthday
      t.string :gender
      t.string :marital_status
      t.string :year
      t.string :paid_type
      t.text   :address
      t.string :contact_no
      t.string :qualification
      t.string :salary
      t.string :entry_no

      t.timestamps null: false
    end
  end
end
