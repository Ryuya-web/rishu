class Likebu < ApplicationRecord
  belongs_to :lessonbu
  belongs_to :user
  validates_uniqueness_of :lessonbu_id, scope: :user_id
end
