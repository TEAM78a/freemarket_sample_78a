class RemoveColumnProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :kind_id, :integer
    add_reference :products, :kind, null: false, foreign_key: true
  end
end