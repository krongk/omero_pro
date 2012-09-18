class CreateJiamengs < ActiveRecord::Migration
  def change
    create_table :jiamengs do |t|
      t.string :name
      t.string :sex
      t.string :phone
      t.string :address
      t.string :jiameng_address
      t.string :zijing
      t.string :dianpu
      t.text :message
      t.string :is_verfied, :default => 'n'
      t.string :verfied_by
      t.string :note

      t.timestamps
    end
  end
end
