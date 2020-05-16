class Lesson < ApplicationRecord
    belongs_to :user 
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    def self.search(search)
        if search
           Lesson.where(['title LIKE ?', "%#{search}%"])
        else
          Lesson.all
        end
    end
end
