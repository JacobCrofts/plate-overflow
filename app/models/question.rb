class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :author, class_name: "User"
  has_many :questions_tags
  has_many :tags, through: :questions_tags

  validates :content, presence: true
  validates :author_id, presence: true

  def sum_votes
    self.votes.map(&:value).reduce(:+)
  end
end
