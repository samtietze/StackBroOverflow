class Answer < ApplicationRecord
  has_many :votes
  has_many :comments, as: :commentable
  belongs_to :answer_author, class_name: "User"
  validates :answer_body, :question_id, :user_id, { presence: true }
  validates :answer_body, length: { maximum: 5000 }
end
