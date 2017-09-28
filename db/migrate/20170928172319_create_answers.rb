class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer_body, null: false, limit: 5000
      t.integer :answer_author_id, null: false
      t.integer :question_id, null: false
      t.boolean :best_answer, default: false

      t.timestamps
    end
  end
end
