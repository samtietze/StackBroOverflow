class AddPageviewsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :pageviews, :integer, default: 0
  end
end
