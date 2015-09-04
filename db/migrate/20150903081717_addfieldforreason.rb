class Addfieldforreason < ActiveRecord::Migration
  def change
    add_column :reasons, :name, :string
  end
end
