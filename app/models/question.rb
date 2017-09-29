class Question < ApplicationRecord
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :question_author, class_name: "User"

  has_many :comments, as: :commentable

# Editing this out since updating the pageviews "updates" the question.
  # def edited?
  #   self.updated_at > self.created_at
  # end

  # def time_display
  #   if edited?
  #     self.updated_at
  #   else
  #     self.created_at
  #   end
  # end

  validates :question_author_id, :subject, :question_body, { presence: true }
  validates :question_body, { length: { maximum: 5000 } }
end
