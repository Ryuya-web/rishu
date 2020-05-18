class Likekyo < ApplicationRecord
  belongs_to :lessonkyo
  belongs_to :user
  validates_uniqueness_of :lessonkyo_id, scope: :user_id
end
