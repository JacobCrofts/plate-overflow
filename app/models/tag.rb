class Tag < ActiveRecord::Base
  belongs_to :question
  validates :name, presence: true
  validates :question_id, presence: true
end
