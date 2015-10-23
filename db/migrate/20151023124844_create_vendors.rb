class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :address
      t.string :contact_no
      t.string :ac_no

      t.timestamps null: false
    end
  end
end
