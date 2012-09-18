class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites,:options=>'charset=utf8'  do |t|
      t.string :name
      t.string :value
    end
    add_index :sites, :name, :unique => true
  end
end
