class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :comment_author, class_name: "User"
  has_many :votes, as: :votable

  def total_votes
    self.votes.map { |vote| vote.value }
  end

  def vote_count
    total_votes.reduce(0, :+)
  end

  validates :comment_author_id, :commentable_type, :commentable_id, :comment_body, { presence: true }
  validates :comment_body, { length: {  maximum: 5000 } }
end
