class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,              null: false
      t.text :introduce,           null: false
      t.integer :price,            null: false
      t.string :kind,              null: false
      t.string :brand,             null: false
      t.string :condition,         null: false
      t.string :postage,           null: false
      t.string :shipment,          null: false
      t.string :shipping_area,     null: false
      t.boolean :sold_out_flg,     null: false, default: false
      t.timestamps
    end

    add_index :products, :name
  end
end
