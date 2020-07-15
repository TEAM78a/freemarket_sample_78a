class CreatePurchaseImages < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_images do |t|
      t.text :image,               null: false
      t.references :purchase,      foreign_key: true
      t.timestamps
    end
  end
end
