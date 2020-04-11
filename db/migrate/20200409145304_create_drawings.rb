class CreateDrawings < ActiveRecord::Migration[6.0]
  def change
    create_table :drawings do |t|
      t.references :round, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :prompt_datum, null: false, foreign_key: true
      t.string :drawing
      t.string :status
      
      t.timestamps
    end
  end
end
