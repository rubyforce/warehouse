class Fewfieldstorequisition < ActiveRecord::Migration
  def change
    add_column :requisitions, :date, :date
    add_column :requisitions, :requisition_no, :string
  end
end
