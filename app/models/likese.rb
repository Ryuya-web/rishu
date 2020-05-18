class Likese < ApplicationRecord
  belongs_to :lessonse
  belongs_to :user
  validates_uniqueness_of :lessonse_id, scope: :user_id
end
