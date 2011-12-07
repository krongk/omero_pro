class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.references :region
      t.references :city
      t.references :district
      t.string :short_address
      t.string :point, :default => '104.072019,30.664474'
      t.string :tel_phone
      t.string :mobile_phone
      t.string :fax
      t.string :email
      t.string :qq
      t.string :bus_list
      t.string :description

      t.timestamps
    end
    add_index :shops, :region_id
    add_index :shops, :city_id
    add_index :shops, :district_id
  end
end
