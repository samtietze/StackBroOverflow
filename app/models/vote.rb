class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

  # validates :voter_id, { uniqueness: { scope: :votable_id } }

  validates :voter, { uniqueness: { scope: :votable } }

  validates :votable_type, :votable_id, :voter_id, { presence: true }
end
