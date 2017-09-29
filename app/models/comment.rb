class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, class_name: "User"

  validates :comment_author_id, :commentable_type, :commentable_id, :comment_body, { presence: true }
  validates :comment_body, { length: {  maximum: 5000 } }
end
