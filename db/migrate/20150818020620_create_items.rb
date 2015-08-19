class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :company_id
      t.string  :min_qty
      t.integer :package_type_id
      t.integer :container_id

      t.timestamps null: false
    end
  end
end
