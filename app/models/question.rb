class Question < ApplicationRecord
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :question_author, class_name: "User"


  validates :user_id, :subject, :question_body, { null: false }
  validates :question_body, { length: { maximum: 5000 } }
end
