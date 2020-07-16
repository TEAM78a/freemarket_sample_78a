class AddBoolianToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :sold_out_flg
    add_column :products, :sold_out_flg, :integer
    add_reference :products, :buye, foreign_key: {to_table: :users}
  end
end
