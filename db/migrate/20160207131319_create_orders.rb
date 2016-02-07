class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.references :shipping_address
      t.references :billing_address

      t.timestamps null: false
    end
  end
end
