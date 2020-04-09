class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.references :room, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
