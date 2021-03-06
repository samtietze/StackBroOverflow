require 'Faker'

class User < ApplicationRecord
  # include BCrypt

  has_many :questions, foreign_key: "question_author_id"
  has_many :answers, foreign_key: "answer_author_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :comments, foreign_key: "comment_author_id"

  validates :username, :email, { presence: true }
  validates :email, :username, { uniqueness: true }
  validate :validate_password

  before_save :include_avatar

  def include_avatar
    self.profile_picture = Faker::LoremPixel.image("300x300")
  end

  def user_question_count
    Question.where(question_author_id: self.id).count
  end

  def user_answer_count
    Answer.where(answer_author_id: self.id).count
  end

  def user_comment_count
    Comment.where(comment_author_id: self.id).count
  end

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(plaintext_password)
    @raw_password = plaintext_password
    @password = BCrypt::Password.create(plaintext_password)
    self.encrypted_password = @password
  end

  def authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      @user
    end
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
