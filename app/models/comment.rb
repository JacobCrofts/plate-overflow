class Comment < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :author, class_name: "User"
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true
  validates :author_id, presence: true
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
end
