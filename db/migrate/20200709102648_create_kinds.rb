class CreateKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :kinds do |t|
      t.string :name,               null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :kinds,:ancestry
  end
end