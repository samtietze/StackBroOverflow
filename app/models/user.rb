class User < ApplicationRecord
  # include BCrypt

  has_many :questions, foreign_key: "question_author_id"
  has_many :answers, foreign_key: "answer_author_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :comments, foreign_key: "comment_author_id"

  validates :username, :email, { presence: true }
  validates :email, :username, { uniqueness: true }
  validate :validate_password

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(plaintext_password)
    @raw_password = plaintext_password
    @password = BCrypt::Password.create(plaintext_password)
    self.encrypted_password = @password
  end

  def self.authenticate(email, password)
    @user = find_by(email: email)
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
