class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.references :shipping_address #, index: true
      t.references :billing_address #, index: true

      t.timestamps null: false
    end

    add_index :orders, :shipping_address_id
    add_index :orders, :billing_address_id
  end
end
