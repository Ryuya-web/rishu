class Likesyo < ApplicationRecord
  belongs_to :lessonsyo
  belongs_to :user
  validates_uniqueness_of :lessonsyo_id, scope: :user_id
end
