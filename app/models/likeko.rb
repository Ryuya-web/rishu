class Likeko < ApplicationRecord
  belongs_to :lessonko
  belongs_to :user
  validates_uniqueness_of :lessonko_id, scope: :user_id
end
