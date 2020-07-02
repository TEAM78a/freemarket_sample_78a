class CreateSendDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :send_destinations do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.integer :postal_code
      t.string :prefectures
      t.string :municipalities
      t.string :address
      t.string :building
      t.integer :phone_number
      t.references :user
      t.timestamps
    end
  end
end
