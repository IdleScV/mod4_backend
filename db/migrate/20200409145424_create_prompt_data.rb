class CreatePromptData < ActiveRecord::Migration[6.0]
  def change
    create_table :prompt_data do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
