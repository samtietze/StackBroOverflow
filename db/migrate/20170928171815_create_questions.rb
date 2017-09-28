class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :question_author_id, null: false
      t.string :subject, null: false
      t.text :question_body, null: false, limit: 5000

      t.timestamps
    end
  end
end
