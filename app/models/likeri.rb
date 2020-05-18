class Likeri < ApplicationRecord
  belongs_to :lessonri
  belongs_to :user
  validates_uniqueness_of :lessonri_id, scope: :user_id
end
