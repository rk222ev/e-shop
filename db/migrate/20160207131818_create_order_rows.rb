class CreateOrderRows < ActiveRecord::Migration
  def change
    create_table :order_rows do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.boolean :status, default: false
      t.boolean :sent, default: false
      t.integer :quantity
      t.integer :price_at_sale

      t.timestamps null: false
    end
  end
end
