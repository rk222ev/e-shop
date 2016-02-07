class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :postal_code
      t.string :city

      t.timestamps null: false
    end
  end
end
