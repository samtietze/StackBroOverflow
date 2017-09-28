class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :comment_author_id, null: false
      t.string :commentable_type, null: false
      t.integer :commentable_id, null: false
      t.text :comment_body, null: false, limit: 5000

      t.timestamps
    end
  end
end
