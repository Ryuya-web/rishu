class Likeno < ApplicationRecord
  belongs_to :lessonno
  belongs_to :user
  validates_uniqueness_of :lessonno_id, scope: :user_id
end
