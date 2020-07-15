class CreatePurchaseImages < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_images do |t|

      t.timestamps
    end
  end
end
