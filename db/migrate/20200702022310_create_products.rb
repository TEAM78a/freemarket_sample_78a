class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,              null: false
      t.text :introduce,           null: false
      t.integer :price,            null: false
      t.integer :kind_id,              null: false
      t.integer :brand_id,             null: false
      t.integer :condition_id,         null: false
      t.integer :postage_id,           null: false
      t.integer :shipment_id,          null: false
      t.integer :prefecture_id,     null: false
      t.boolean :sold_out_flg,     null: false, default: false
      t.timestamps
    end

    add_index :products, :name
  end
end
