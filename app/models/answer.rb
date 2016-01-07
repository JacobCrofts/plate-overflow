class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :author, class_name: "User"

  validates :content, presence: true
  validates :author_id, presence: true
  validates :question_id, presence: true

end
