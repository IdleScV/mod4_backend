class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :max_number
      t.string :status
      t.integer :room_number

      t.timestamps
    end
  end
end
