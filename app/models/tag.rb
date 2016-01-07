class Tag < ActiveRecord::Base
  has_many :questions_tags
  has_many :questions, through: :questions_tags

  validates :name, presence: true
  validates :name, uniqueness: true
end
