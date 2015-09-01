class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.decimal :qty
      t.string  :reason
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
