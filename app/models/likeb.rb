class Likeb < ApplicationRecord
  belongs_to :lessonb
  belongs_to :user
  validates_uniqueness_of :lessonb_id, scope: :user_id
end
