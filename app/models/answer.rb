class Answer < ApplicationRecord
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :answer_author, class_name: "User"

  def total_votes
    self.votes.map { |vote| vote.value }
  end

  def vote_count
    total_votes.reduce(0, :+)
  end

  validates :answer_body, :question_id, :answer_author_id, { presence: true }
  validates :answer_body, length: { maximum: 5000 }
end
