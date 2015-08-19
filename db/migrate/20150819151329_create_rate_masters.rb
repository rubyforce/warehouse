class CreateRateMasters < ActiveRecord::Migration
  def change
    create_table :rate_masters do |t|

      t.timestamps null: false
    end
  end
end
