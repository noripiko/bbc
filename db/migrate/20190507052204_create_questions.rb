class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :word
      t.string :group
      t.integer :user_id
      t.text :text
      t.timestamps
    end
  end
end
