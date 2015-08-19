class CreatePackageTypes < ActiveRecord::Migration
  def change
    create_table :package_types do |t|
      t.string  :name

      t.timestamps null: false
    end
  end
end
