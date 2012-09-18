class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.string :phone
      t.string :address
      t.date :order_time
      t.integer :order_count
      t.text :message
      t.string :code
      t.string :is_verfied, :default => 'n'
      t.string :verfied_by
      t.string :note

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
