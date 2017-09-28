class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :votable_type, null: false
      t.integer :votable_id, null: false
      t.integer :voter_id, null: false
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
