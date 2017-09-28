class Question < ApplicationRecord
  has_many :answers
  has_many :votes, as: :votable


  validates :user_id, :subject, :question_body, { null: false }
  validates :question_body, { limit: { maximum: 5000 } }
end
