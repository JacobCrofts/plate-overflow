class User < ActiveRecord::Base
  has_many :votes, foreign_key: :voter_id
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :username, presence: true
  validates :hashed_password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :hashed_password, uniqueness: true

  def password
    @password ||= BCrypt::Password.create(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(email, password)
    self.email == email && self.hashed_password == hashed_password
  end

  def author_of_answer?(answer)
    answer.author_id == self.id
  end
end
