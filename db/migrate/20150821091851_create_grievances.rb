class CreateGrievances < ActiveRecord::Migration
  def change
    create_table :grievances do |t|
      t.date :date
      t.text :note
      t.string :voucher_no

      t.timestamps null: false
    end
  end
end
