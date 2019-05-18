class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.datetime :audit_month
      t.string :store_id

      t.timestamps
    end
  end
end
