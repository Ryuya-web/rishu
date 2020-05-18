class Likeke < ApplicationRecord
  belongs_to :lessonke
  belongs_to :user
  validates_uniqueness_of :lessonke_id, scope: :user_id
end
