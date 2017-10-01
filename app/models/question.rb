class Question < ApplicationRecord
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :question_author, class_name: "User"

  has_many :comments, as: :commentable

  def total_votes
    self.votes.map { |vote| vote.value }
  end

  def vote_count
    total_votes.reduce(0, :+)
  end


  validates :question_author_id, :subject, :question_body, { presence: true }
  validates :question_body, { length: { maximum: 5000 } }
end





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
