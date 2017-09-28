class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, class_name: "User"

  validates :author_id, :commentable_type, :commentable_id, :comment_body, { presence: true }
  validates :comment_body, { limit: {  maximum: 5000 } }
end
