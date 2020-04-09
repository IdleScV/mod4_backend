class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :drawing
      t.string :comment
      t.boolean :like

      t.timestamps
    end
  end
end
