class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  validates :voter_id, presence: true
  validates :votable_type, presence: true
  validates :value, presence: true
  validates :votable_id, presence: true

end
