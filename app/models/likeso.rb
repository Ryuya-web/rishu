class Likeso < ApplicationRecord
  belongs_to :lessonso
  belongs_to :user
  validates_uniqueness_of :lessonso_id, scope: :user_id
end
