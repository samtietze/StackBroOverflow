class Answer < ApplicationRecord
  has_many :votes
  has_many :comments, as: :commentable
  belongs_to :answer_author, class_name: "User"
  validates :text, :question_id, :user_id, { presence: true }
end
