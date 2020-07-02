class CreateSendDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :send_destinations do |t|

      t.timestamps
    end
  end
end
