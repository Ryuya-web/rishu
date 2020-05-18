class Likeh < ApplicationRecord
  belongs_to :lessonh
  belongs_to :user
  validates_uniqueness_of :lessonh_id, scope: :user_id
end
