class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :name
      t.text    :address
      t.string  :contact_no
      t.string  :tax

      t.timestamps null: false
    end
  end
end
