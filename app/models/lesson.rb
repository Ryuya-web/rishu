class Lesson < ApplicationRecord
    belongs_to :user 
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lesson.where(['title LIKE ?', "%#{search}%"])
        else
          Lesson.all
        end
    end
    def self.searches(search)
      if search
         Lesson.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lesson.all
      end
  end
end
