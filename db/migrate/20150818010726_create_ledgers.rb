class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.string :name
      t.text   :address
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
