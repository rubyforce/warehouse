class CreateOutstandingPayments < ActiveRecord::Migration
  def change
    create_table :outstanding_payments do |t|

      t.timestamps null: false
    end
  end
end
