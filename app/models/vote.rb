class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :user, { uniqueness: { scope: :votable_id } }

  validates :votable_type, :votable_id, :user_id, { presence: true }
end
