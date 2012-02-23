class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :sex
      t.date :birth
      t.string :phone
      t.string :email
      t.string :password
      t.string :confirm
      t.string :captcha
      t.string :is_deleted, :default => 'n'

      t.timestamps
    end
  end
end
